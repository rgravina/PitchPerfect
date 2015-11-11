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

  override func viewDidLoad() {
    super.viewDidLoad()
    if let filePath = NSBundle.mainBundle().pathForResource("quote", ofType: "m4a") {
      let filePathURL = NSURL(fileURLWithPath: filePath)
      audioPlayer = try? AVAudioPlayer(contentsOfURL: filePathURL)
    } else {
      print("Could not find quote.m4a in the app bundle.");
    }
  }

  @IBAction func playSoundSlowly(sender: UIButton) {
    audioPlayer.stop()
    audioPlayer.enableRate = true
    audioPlayer.rate = 0.5
    audioPlayer.play()
  }

  @IBAction func playSoundQuickly(sender: UIButton) {
    audioPlayer.stop()
    audioPlayer.enableRate = true
    audioPlayer.rate = 1.5
    audioPlayer.play()
  }

  @IBAction func stopPlayingSound(sender: UIButton) {
    audioPlayer.stop()
  }
}
