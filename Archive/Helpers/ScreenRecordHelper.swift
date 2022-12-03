//
//  ScreenRecordHelper.swift
//  GravityMotionDemo
//
//  Created by Sunil Zalavadiya on 24/01/22.
//

import Foundation
import ReplayKit

class ScreenRecordHelper: NSObject {
    
    // MARK: - Properties
    var assetWriter: AVAssetWriter?
    var videoInput: AVAssetWriterInput?
    var outputURL: URL!
    
    func startRecording(_ sender: UIView, _ r: RPScreenRecorder, completionHandler: @escaping ((Bool) -> ())) {
        
        r.startRecording(handler: { (error: Error?) -> Void in
            if error == nil { // Recording has started
                completionHandler(true)
            } else {
                // Handle error
                print(error?.localizedDescription ?? "Unknown error")
                completionHandler(false)
            }
        })
    }
    
    func stopRecording(_ sender: UIView, _ r: RPScreenRecorder, _ presentFrom: UIViewController, completionHandler: @escaping ((Bool) -> ())) {
        r.stopRecording( handler: { previewViewController, error in
            
            if let pvc = previewViewController {
                completionHandler(true)
                if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
                    pvc.modalPresentationStyle = UIModalPresentationStyle.popover
                    pvc.popoverPresentationController?.sourceRect = CGRect.zero
                    pvc.popoverPresentationController?.sourceView = presentFrom.view
                }

                pvc.previewControllerDelegate = self
                presentFrom.present(pvc, animated: true, completion: nil)
            }
            else if let error = error {
                print(error.localizedDescription)
                completionHandler(false)
            }
            
        })
    }
    
    func stopRecording(outputURL: URL, _ sender: UIView, _ r: RPScreenRecorder, _ presentFrom: UIViewController, completionHandler: @escaping ((Bool) -> ())) {
        if #available(iOS 14.0, *) {
            r.stopRecording(withOutput: outputURL) { error in
                if let error = error {
                    DLog("stopRecording error = \(error)")
                    completionHandler(false)
                } else {
                    completionHandler(true)
                }
            }
        } else {
            // Fallback on earlier versions
            completionHandler(false)
        }
    }
    
    func startCapturing(outputURL: URL, _ recorder: RPScreenRecorder, recordingHandler: @escaping ((Bool) -> ())) {
        self.outputURL = outputURL
        DLog("outputURL file exist = \(FileHelperManager.isFileExistsAtPath(fileURL: outputURL))")
        do {
            assetWriter = try AVAssetWriter(outputURL: outputURL, fileType:
                                                AVFileType.mp4)
            //-- Video Input
            let videoOutputSettings: [String: Any] = [
                AVVideoCodecKey: AVVideoCodecType.h264,
                AVVideoWidthKey: UIScreen.main.nativeBounds.size.width,
                AVVideoHeightKey: UIScreen.main.nativeBounds.size.height
            ]
            
            videoInput = AVAssetWriterInput (mediaType: .video, outputSettings: videoOutputSettings)
            
            videoInput?.expectsMediaDataInRealTime = true
            
            assetWriter?.add(videoInput!)
            
            recorder.startCapture(handler: { (sample, bufferType, error) in
//                    recordingHandler(error)
                DLog("Recording")
                if CMSampleBufferDataIsReady(sample) {
                    DispatchQueue.main.async { [weak self] in
                        guard let `self` = self else {
                            return
                        }
                        if self.assetWriter?.status == AVAssetWriter.Status.unknown {
                            self.assetWriter?.startWriting()
                            self.assetWriter?.startSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sample))
                        }
                        if self.assetWriter?.status == AVAssetWriter.Status.failed {
                            DLog("Error occured, status = \(String(describing: self.assetWriter?.status.rawValue)), \(String(describing: self.assetWriter?.error?.localizedDescription)) \(String(describing: self.assetWriter?.error))")
                            self.assetWriter?.cancelWriting()
                            self.assetWriter?.endSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sample))
                            recordingHandler(false)
                            return
                        }
                        //-- Video Data
                        if (bufferType == .video), let isReadyForMoreMediaData = self.videoInput?.isReadyForMoreMediaData, isReadyForMoreMediaData == true {
                            self.videoInput?.append(sample)
                        }
                    }
                }
            }, completionHandler: { (error) in
                if let error = error {
                    DLog("recorder error = \(error)")
                    recordingHandler(false)
                } else {
                    DLog("recorder success")
                    recordingHandler(true)
                }
            })
        } catch {
            DLog("assetWriter error = \(error)")
            recordingHandler(false)
        }
    }
    
    func stopCapturing(recorder: RPScreenRecorder, completionHandler: @escaping ((Bool) -> ())) {
        recorder.stopCapture { (error) in
            if let error = error {
                DLog("stopCapturing error = \(error)")
                completionHandler(false)
            } else {
                self.videoInput?.markAsFinished()
                self.assetWriter?.finishWriting(completionHandler: {
                    if self.assetWriter?.status == .completed {
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                })
            }
        }
    }
}

// MARK: - RPPreviewViewControllerDelegate
extension ScreenRecordHelper: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        previewController.dismiss(animated: true, completion: nil)
    }
}
