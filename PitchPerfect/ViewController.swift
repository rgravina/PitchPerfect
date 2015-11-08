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
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var microphoneButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    stopButton.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func recordAudio(sender: UIButton) {
    microphoneButton.enabled = false
    recordingLabel.hidden = false
    stopButton.hidden = false
  }

  @IBAction func stopRecordingAudio(sender: UIButton) {
    microphoneButton.enabled = true
    recordingLabel.hidden = true
    stopButton.hidden = true
  }
}
