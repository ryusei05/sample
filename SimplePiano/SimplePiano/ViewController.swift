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
    
    let soundArray:[String] = ["do","re","mi","fa","so","ra","si"]
    let timeArray:[Double] = [1.0,1.0,1.0,1.0,1.0,1.0,1.0]
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAutoPlay(sender:AnyObject) {
        count = 0
        autoPlay()
    }
    
    func autoPlay() {
        if count >= soundArray.count {
            return
        }
        
        print("/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/1_\(count+1)" + "\(soundArray[count])" + ".mp3")

        soundManager.play("/Users/ryusei/Documents/sandbox/swift_sample/SimplePiano/1_\(count+1)" + "\(soundArray[count])" + ".mp3")
        
        let sel = Selector("autoPlay")
        let interval:NSTimeInterval = timeArray[count]
        NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: sel, userInfo: nil, repeats: false)
//        NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: #selector(autoPlay), userInfo: nil, repeats: false)
        
        count += 1
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
            soundManager.play("s_1_1do")
        case 2:
            soundManager.play("s_1_2re")
        case 3:
            soundManager.play("s_1_3mi")
        case 4:
            soundManager.play("s_1_4fa")
        case 5:
            soundManager.play("s_1_5so")
        case 6:
            soundManager.play("s_1_6ra")
        case 7:
            soundManager.play("s_1_7si")

        case 11:
            soundManager.play("s_chick")
        case 12:
            soundManager.play("s_cow")
        case 13:
            soundManager.play("s_mouse")
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

