//
//  ViewController.swift
//  TDLLY
//
//  Created by farido on 1/3/19.
//  Copyright © 2019 Farido. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class videoHome: UIViewController {
    
    @IBOutlet weak var videoView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    private func setUpView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "Produce", ofType: "mp4")!)
        let player = AVPlayer(url: path)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
//        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let loginVC = storyborad.instantiateViewController(withIdentifier: "loginVC") as? ViewController
//        present(loginVC!, animated: true, completion: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoHome.videoDidPlayToEnd(_:)), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
//
////        NotificationCenter.default.addObserver(self, selector: NSNotification.Name(rawValue: #selector(ViewController.videoDidPlayToEnd(_: )), name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimenotification"), object: player.currentItem)
//
   }
//
    @objc func videoDidPlayToEnd(_ notification: Notification) {
        performSegue(withIdentifier: "suge", sender: nil)
//        let palyer: AVPlayerItem = notification.object as! AVPlayerItem
//        palyer.seek(to: CMTime.zero)
    }

    
}

