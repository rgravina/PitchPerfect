//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Robert Gravina on 11/10/15.
//  Copyright © 2015 Robert Gravina. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
  var audioPlayer:AVAudioPlayer!
  var recievedAudio:RecordedAudio!

  override func viewDidLoad() {
    super.viewDidLoad()
    audioPlayer = try! AVAudioPlayer(contentsOfURL: recievedAudio.filePathURL)
  }

  @IBAction func playSoundSlowly(sender: UIButton) {
    audioPlayer.stop()
    audioPlayer.enableRate = true
    audioPlayer.rate = 0.5
    audioPlayer.currentTime = 0.0
    audioPlayer.play()
  }

  @IBAction func playSoundQuickly(sender: UIButton) {
    audioPlayer.stop()
    audioPlayer.enableRate = true
    audioPlayer.rate = 1.5
    audioPlayer.currentTime = 0.0
    audioPlayer.play()
  }

  @IBAction func playChipmunkAudio(sender: UIButton) {

  }

  @IBAction func stopPlayingSound(sender: UIButton) {
    audioPlayer.stop()
  }
}
