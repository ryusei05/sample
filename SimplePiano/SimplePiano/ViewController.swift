//
//  ViewController.swift
//  SimplePiano
//
//  Created by 丸山 隆清 on 2016/11/17.
//  Copyright © 2016年 Ryusei Maruyama. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer? = nil
    var soundVolume = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(sender:UIButton) {
        print("Tapped")
        
//        let soundPath = (NSBundle.mainBundle().bundlePath as NSString).stringByAppendingPathComponent("CLAP!.mp3")
//        let url:NSURL? = NSURL.fileURLwithPath(soundPath)
        let soundPath = NSURL(fileURLWithPath: "/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/CLAP!.mp3")
        player?.stop()
        player = nil
//        player = try? AVAudioPlayer(contentsOfURL: url!)
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

