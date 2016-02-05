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
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            var fileUrl = NSURL.fileURLWithPath(filePath);
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: fileUrl);
            } catch {
                print("problem in AVAudioPlayer");
            };
        } else {
            print("the filepath is empty");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(sender: UIButton) {
        
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
