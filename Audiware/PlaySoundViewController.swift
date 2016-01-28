//
//  PlaySoundViewController.swift
//  Audiware
//
//  Created by Davi Rodrigues Chaves on 1/4/16.
//  Copyright © 2016 davichaves. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("button-09", ofType: "wav")!)
//        print(alertSound)
//        
//        var error:NSError?
//        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
//        audioPlayer.prepareToPlay()
//        audioPlayer.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: UIButton) {
        //play slow
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
