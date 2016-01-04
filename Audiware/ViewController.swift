//
//  ViewController.swift
//  Audiware
//
//  Created by Davi Rodrigues Chaves on 12/30/15.
//  Copyright © 2015 davichaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var stop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stop.hidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func recordAudio(sender: UIButton) {
        text.hidden = false //show text
        stop.hidden = false //show button
        print("record")
    }

    @IBAction func stopRecording(sender: UIButton) {
        text.hidden = true
        print("stop")
    }

}

