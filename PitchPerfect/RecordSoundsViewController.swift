//
//  RecordSoundsViewController.swift
//  PitchPerfact
//
//  Created by Robert Gravina on 11/6/15.
//  Copyright © 2015 Robert Gravina. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
  @IBOutlet weak var recordingLabel: UILabel!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var microphoneButton: UIButton!

  var audioRecorder: AVAudioRecorder!
  var recordedAudio: RecordedAudio!

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

    // Save recording.wav in documents dir
    let documentDirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    let recordingName = "recording.wav"
    let pathArray = [documentDirPath, recordingName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    print(filePath)

    // create an audiosession and record
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
    try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
    audioRecorder.delegate = self
    audioRecorder.meteringEnabled = true
    audioRecorder.prepareToRecord()
    audioRecorder.record()
  }

  func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
    if (flag) {
      recordedAudio = RecordedAudio()
      recordedAudio.filePathURL = recorder.url
      recordedAudio.title = recorder.url.lastPathComponent
      self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
    } else {
      print("Recording was not successful.")
      microphoneButton.enabled = true
      stopButton.hidden = true
    }
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if (segue.identifier == "stopRecording") {
      let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
      let data = sender as! RecordedAudio
      playSoundsVC.recievedAudio = data
    }
  }

  @IBAction func stopRecordingAudio(sender: UIButton) {
    microphoneButton.enabled = true
    recordingLabel.hidden = true
    stopButton.hidden = true
    audioRecorder.stop()
    let session = AVAudioSession.sharedInstance()
    try! session.setActive(false)
  }
}
