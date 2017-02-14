//
//  SoundManager.swift
//  SimplePiano
//
//  Created by 丸山 隆清 on 2017/02/14.
//  Copyright © 2017年 Ryusei Maruyama. All rights reserved.
//

import UIKit
import AVFoundation

class SoundManager: NSObject {
    var player:AVAudioPlayer? = nil
    var soundVolume = 1.0
    
    func play(fileName:String) {
/*
        let soundPath = (NSBundle.mainBundle().bundlePath as NSString).stringByAppendingPathComponent(fileName)
        let url:NSURL? = NSURL.fileURLWithPath(soundPath)
        player?.stop()
        player = nil
        player = try?AVAudioPlayer(contentsOfURL: url!)
        if let player = player {
            player.prepareToPlay()
            player.play()
        }
*/
        
        let soundPath = NSURL(fileURLWithPath: fileName)
        player?.stop()
        player = nil
        player = try? AVAudioPlayer(contentsOfURL: soundPath)
        
        if let player = player {
            player.numberOfLoops = -1
            player.prepareToPlay()
            player.play()
        } else {
            print("みつかんねー")
        }
        
        
    }
}
