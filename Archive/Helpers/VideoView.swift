//
//  VideoView.swift
//  Example
//
//  Created by Sunil Zalavadiya on 11/08/18.
//  Copyright © 2018 Sunil Zalavadiya. All rights reserved.
//

import UIKit
import AVFoundation

class VideoView: UIView {
    
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isLoop: Bool = true
    private var startTime: Double = 0
    
    fileprivate var periodicTimeObserver: Any?
    fileprivate var displayLink: CADisplayLink?
    
    fileprivate var playerStatusHandler: ((_ isPlaying: Bool) -> ())?
    var onPlayerProgressUpdate: ((_ totalDuration: Double, _ currentDuration: Double) -> ())? {
        didSet {
            if player != nil {
                startProgressUpdate()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
    
    func configure(videoURL: URL, remote: Bool = false) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        stopPlayerProgressUpdate()
        if player != nil {
            player?.removeObserver(self, forKeyPath: "timeControlStatus")
            player?.pause()
            player = nil
        }
        
        if playerLayer != nil {
            playerLayer?.removeFromSuperlayer()
            playerLayer = nil
        }
        
        //        if remote {
        //            let _playerItem = _resourceLoader.playItem(with: videoURL)
        //            player = AVPlayer(playerItem: _playerItem)
        //        } else {
        //            player = AVPlayer(url: videoURL)
        //        }
        startTime = 0
        player = AVPlayer(url: videoURL)
        
        player?.play()
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        if let playerLayer = self.playerLayer {
            layer.addSublayer(playerLayer)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        if onPlayerProgressUpdate != nil {
            startProgressUpdate()
        }
        player?.addObserver(self, forKeyPath: "timeControlStatus", options: .new, context: nil)
        
    }
    
    func configure(videoAsset: AVAsset, playImmediatelly: Bool = true) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        stopPlayerProgressUpdate()
        if player != nil {
            player?.removeObserver(self, forKeyPath: "timeControlStatus")
            player?.pause()
            player = nil
        }
        
        if playerLayer != nil {
            playerLayer?.removeFromSuperlayer()
            playerLayer = nil
        }
        
//        if remote {
//            let _playerItem = _resourceLoader.playItem(with: videoURL)
//            player = AVPlayer(playerItem: _playerItem)
//        } else {
//            player = AVPlayer(url: videoURL)
//        }
        startTime = 0
        let playerItem = AVPlayerItem(asset: videoAsset)
        player = AVPlayer(playerItem: playerItem)
        
        if playImmediatelly {
            player?.play()
        }
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        if let playerLayer = self.playerLayer {
            layer.addSublayer(playerLayer)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        if onPlayerProgressUpdate != nil {
            startProgressUpdate()
        }
        player?.addObserver(self, forKeyPath: "timeControlStatus", options: .new, context: nil)
        
    }
    
    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
            playerStatusHandler?(isPlaying())
        }
    }
    
    func pause() {
        player?.pause()
        playerStatusHandler?(isPlaying())
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
        playerStatusHandler?(isPlaying())
    }
    
    func totalDuration() -> Double {
        return player?.currentItem?.duration.seconds ?? 0
    }
    
    func currentDuration() -> Double {
        return player?.currentTime().seconds ?? 0
    }
    
    func isPlaying() -> Bool
    {
        return player?.timeControlStatus == AVPlayer.TimeControlStatus.playing
    }
    
    func playerStatusDidChange(statusHandler: ((_ isPlaying: Bool) -> ())?)
    {
        playerStatusHandler = statusHandler
    }
    
    func replaceVideoWith(playerItem: AVPlayerItem) {
        self.player?.replaceCurrentItem(with: playerItem)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        
        player?.pause()
        player?.seek(to: CMTime(seconds: startTime, preferredTimescale: self.player?.currentItem?.duration.timescale ?? 1000))
        
        if isLoop {
            player?.play()
            playerStatusHandler?(true)
        } else {
            playerStatusHandler?(false)
        }
        
        guard let player = self.player else {
            return
        }
        let totalDuration = player.currentItem?.duration.seconds ?? 0
//        let currentTime = player.currentTime().seconds
        self.onPlayerProgressUpdate?(totalDuration, startTime)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "timeControlStatus"
        {
            playerStatusHandler?(isPlaying())
        }
        
    }

}

extension VideoView {
    private func addPeriodicTimeObserver() {
        // Notify every half second
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.1, preferredTimescale: timeScale)

        periodicTimeObserver = player?.addPeriodicTimeObserver(forInterval: time,
                                                          queue: .main) {
            [weak self] time in
            // update player transport UI
            guard let `self` = self, self.isPlaying(), let player = self.player else {
                return
            }
            let totalDuration = player.currentItem?.duration.seconds ?? 0
            let currentTime = player.currentTime().seconds
            self.onPlayerProgressUpdate?(totalDuration, currentTime)
        }
    }

    private func removePeriodicTimeObserver() {
        if let periodicTimeObserver = periodicTimeObserver {
            player?.removeTimeObserver(periodicTimeObserver)
            self.periodicTimeObserver = nil
        }
    }
    
    private func startProgressUpdate() {
        stopPlayerProgressUpdate()
        if displayLink == nil {
            displayLink = CADisplayLink(target: self, selector: #selector(updateTrackProgress))
            displayLink?.add(to: .current, forMode: .common)
        }
    }
    
    func stopPlayerProgressUpdate() {
        displayLink?.remove(from: .current, forMode: .common)
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func updateTrackProgress() {
        guard let player = self.player, self.isPlaying() else {
            return
        }
        let totalDuration = player.currentItem?.duration.seconds ?? 0
        let currentTime = player.currentTime().seconds
        self.onPlayerProgressUpdate?(totalDuration, currentTime)
    }
}
