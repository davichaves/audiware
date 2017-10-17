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
    
    var audioSession:AVAudioSession!
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: receivedAudio.filePathUrl as URL);
        } catch {
            print("problem in AVAudioPlayer");
        }
        audioPlayer.enableRate = true;
        
        audioEngine = AVAudioEngine();
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl as URL);
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.speaker)
        } catch _ {
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlow(_ sender: UIButton) {
        playAudio(0.5);
    }

    @IBAction func playFast(_ sender: UIButton) {
        playAudio(1.5);
    }

    @IBAction func playChipmunk(_ sender: UIButton) {
        playAudioWithVariablePitch(1000);
    }
    
    @IBAction func playVader(_ sender: UIButton) {
        playAudioWithVariablePitch(-1000);
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        let textToShare = "Swift is awesome!  Check out this website about it!"
        
        if let myWebsite = URL(string: "http://www.codingexplorer.com/") {
            let objectsToShare = [textToShare, myWebsite] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func playAudioWithVariablePitch(_ pitch: Float) {
        audioPlayer.stop();
        audioEngine.stop();
        audioEngine.reset();
        
        let audioPlayerNode = AVAudioPlayerNode();
        audioEngine.attach(audioPlayerNode);
        
        let changePitchEffect = AVAudioUnitTimePitch();
        changePitchEffect.pitch = pitch;
        audioEngine.attach(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil);
        try! audioEngine.start();
        
        audioPlayerNode.play();
    }
    
    func playAudio(_ myRate: Float) {
        audioEngine.stop();
        audioEngine.reset();
        audioPlayer.stop();
        audioPlayer.rate = myRate;
        audioPlayer.currentTime = 0.0;
        audioPlayer.play();
    }
    
    @IBAction func stopPlaying(_ sender: UIButton) {
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
