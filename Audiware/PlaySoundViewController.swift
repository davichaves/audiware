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
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3") {
            let fileUrl = NSURL.fileURLWithPath(filePath);
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
        playAudio(0.5);
    }

    @IBAction func playFast(sender: UIButton) {
        playAudio(1.5);
    }
    
    func playAudio(myRate: Float) {
        audioPlayer.stop();
        audioPlayer.enableRate = true;
        audioPlayer.rate = myRate;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play();
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop();
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
