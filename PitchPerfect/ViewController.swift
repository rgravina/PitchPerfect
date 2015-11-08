//
//  ViewController.swift
//  PitchPerfact
//
//  Created by Robert Gravina on 11/6/15.
//  Copyright © 2015 Robert Gravina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var recordingLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func recordAudio(sender: UIButton) {
    recordingLabel.hidden = false
  }

  @IBAction func stopRecordingAudio(sender: UIButton) {
    recordingLabel.hidden = true
  }
}
