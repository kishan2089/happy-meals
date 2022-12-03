//
//  ScreenRecorder.swift
//  Video Maker
//
//  Created by Kartum on 04/10/22.
//

import Foundation
import ReplayKit
import AVKit


class ScreenRecorder {
    var assetWriter: AVAssetWriter?
    var videoInput: AVAssetWriterInput?
    var audioInput: AVAssetWriterInput?
    var recorder = RPScreenRecorder.shared()
    var fileURL: URL?
    var timer: Timer?
    
    // MARK: ====================================
    // MARK: ScreenRecorder with Capture Screen event
    // MARK: ====================================
    
    func startRecording(withFilepath fileURL: URL, recordingHandler:@escaping (Error?) -> Void) {
        do {
            assetWriter = try AVAssetWriter(outputURL: fileURL, fileType:
                AVFileType.mp4)
            //-- Video Input
            let videoOutputSettings: [String: Any] = [
                AVVideoCodecKey: AVVideoCodecType.h264,
                AVVideoWidthKey: UIScreen.main.bounds.size.width,
                AVVideoHeightKey: UIScreen.main.bounds.size.height,
                AVVideoCompressionPropertiesKey: [AVVideoAverageBitRateKey: 2300000,
                                                  AVVideoProfileLevelKey: AVVideoProfileLevelH264High40]
            ]
            //-- Audio Input
            var channelLayout = AudioChannelLayout()
            channelLayout.mChannelLayoutTag = kAudioChannelLayoutTag_MPEG_5_1_D
            let audioOutputSettings: [String: Any] = [
                AVNumberOfChannelsKey: 6,
                AVFormatIDKey: kAudioFormatMPEG4AAC_HE,
                AVSampleRateKey: 44100,
                AVEncoderBitRateKey: 128000,
                AVChannelLayoutKey: NSData(bytes: &channelLayout, length: MemoryLayout.size(ofValue: channelLayout))
            ]
            
            audioInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioOutputSettings)
            videoInput = AVAssetWriterInput (mediaType: .video, outputSettings: videoOutputSettings)
            
            audioInput?.expectsMediaDataInRealTime = true
            videoInput?.expectsMediaDataInRealTime = true
            
            assetWriter?.add(audioInput!)
            assetWriter?.add(videoInput!)
            
            recorder.isMicrophoneEnabled = true
            
            recorder.startCapture(handler: { (sample, bufferType, error) in
                recordingHandler(error)
              
                if CMSampleBufferDataIsReady(sample) {
                    if self.assetWriter?.status == AVAssetWriter.Status.unknown {
                        self.assetWriter?.startWriting()
                        self.assetWriter?.startSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sample))
                    }
                    if self.assetWriter?.status == AVAssetWriter.Status.failed {
                        print("Error occured, status = \(String(describing: self.assetWriter?.status.rawValue)), \(String(describing: self.assetWriter?.error?.localizedDescription)) \(String(describing: self.assetWriter?.error))")
                        self.assetWriter?.cancelWriting()
                        self.assetWriter?.endSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sample))
                        recordingHandler(error)
                        return
                    }
                    //-- Video Data
                    if (bufferType == .video), let isReadyForMoreMediaData = self.videoInput?.isReadyForMoreMediaData, isReadyForMoreMediaData == true {
                        self.videoInput?.append(sample)
                    }
                    //-- Audio Data
                    if (bufferType == .audioApp || bufferType == .audioMic), let isReadyForMoreMediaData = self.audioInput?.isReadyForMoreMediaData, isReadyForMoreMediaData == true {
                        self.audioInput?.append(sample)
                    }
                }
            }, completionHandler: { (error) in
                recordingHandler(error)
            })
        } catch {
            recordingHandler(error)
        }
    }
    
    func stopRecording(handler: @escaping (Error?) -> Void) {
        recorder.stopCapture { (error) in
            handler(error)
            if self.assetWriter?.status == AVAssetWriter.Status.failed || self.assetWriter?.status == AVAssetWriter.Status.cancelled || self.assetWriter?.status == AVAssetWriter.Status.unknown || self.assetWriter?.status == AVAssetWriter.Status.completed {
                return
            } else {
                self.audioInput?.markAsFinished()
                self.videoInput?.markAsFinished()
                self.assetWriter?.finishWriting(completionHandler: {
                })
            }
        }
    }
    
   class func createReplaysFolder() {
        // path to documents directory
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        if let documentDirectoryPath = documentDirectoryPath {
            // create the custom folder path
            let replayDirectoryPath = documentDirectoryPath.appending("/Replays")
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: replayDirectoryPath) {
                do {
                    try fileManager.createDirectory(atPath: replayDirectoryPath,
                                                    withIntermediateDirectories: false,
                                                    attributes: nil)
                } catch {
                    print("Error creating Replays folder in documents dir: \(error)")
                }
            }
        }
    }
    
   class func filePath(_ fileName: String) -> String {
        createReplaysFolder()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0] as String
        let filePath: String = "\(documentsDirectory)/Replays/\(fileName).mp4"
        return filePath
    }
}
