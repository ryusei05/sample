//
//  ViewController.swift
//  SimplePiano
//
//  Created by 丸山 隆清 on 2016/11/17.
//  Copyright © 2016年 Ryusei Maruyama. All rights reserved.
//

import UIKit
import AVFoundation
import ReplayKit

class ViewController: UIViewController {
    var player:AVAudioPlayer? = nil
    var soundVolume = 1.0

    let soundManager = SoundManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordTapped(sender:UIButton) {
        RPScreenRecorder.sharedRecorder().startRecordingWithMicrophoneEnabled(true, handler: nil)
    }

    @IBAction func stopTapped(sender:UIButton) {
        RPScreenRecorder.sharedRecorder().stopRecordingWithHandler{ (previewCotroller:RPPreviewViewController?, error:NSError?) in
            self.presentViewController(previewCotroller!, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonTapped(sender:UIButton) {
        print("Tapped")
        
        switch sender.tag {
        case 1:
            soundManager.play("/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/chick.mp3")
        case 2:
            soundManager.play("/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/cow.mp3")
        case 3:
            soundManager.play("/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/mouse.mp3")
        default:
            break
        }

        UIView.animateWithDuration(0.5,
                            delay: 0,
                            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                sender.center = CGPointMake(sender.center.x, sender.center.y - 20)
            }){(_)in
                UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut,
                    animations: {
                        sender.center = CGPointMake(sender.center.x, sender.center.y + 20)
                        
                    }){(_)in
                }
        
        }
        
/*
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
*/
    }
    


}

