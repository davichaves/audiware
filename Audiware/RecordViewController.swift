//
//  RecordViewController.swift
//  Audiware
//
//  Created by Davi Rodrigues Chaves on 12/30/15.
//  Copyright © 2015 davichaves. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class RecordViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    var interstitial: GADInterstitial! //this is for the ads
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-8649930298352151/4522760426")
        
        let request = GADRequest()
        // Requests test ads on test devices.
        request.testDevices = ["2077ef9a63d2b398840261c8221a0c9b"]
        self.interstitial.load(request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        stop.isHidden = true;
        recordButton.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        text.isHidden = false //show text
        stop.isHidden = false //show button
        recordButton.isEnabled = false //disable button
        print("record")
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recording.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag) {
            recordedAudio = RecordedAudio(_filePathUrl: recorder.url, _title: recorder.url.lastPathComponent);
            self.performSegue(withIdentifier: "stopRecording", sender: recordedAudio);
        } else {
            print("Recording was not successful");
            recordButton.isEnabled = true;
            stop.isHidden = true;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.interstitial.isReady {
            // TODO: self.interstitial.present(fromRootViewController: self)
        }
        if(segue.identifier == "stopRecording") {
            let playSoundsVC:PlaySoundViewController = segue.destination as! PlaySoundViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data;
        }
    }

    @IBAction func stopRecording(_ sender: UIButton) {
        text.isHidden = true
        print("stop")
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

}

