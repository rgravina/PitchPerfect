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
  var audioEngine:AVAudioEngine!
  var audioFile:AVAudioFile!

  override func viewDidLoad() {
    super.viewDidLoad()
    audioPlayer = try! AVAudioPlayer(contentsOfURL: recievedAudio.filePathURL)
    audioFile = try! AVAudioFile(forReading: recievedAudio.filePathURL)
    audioEngine = AVAudioEngine()
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
    playAudioWithVariablePitch(1000)
  }
  
  func playAudioWithVariablePitch(pitch: Float) {
    audioPlayer.stop()
    audioEngine.stop()
    audioEngine.reset()
    let audioPlayerNode = AVAudioPlayerNode();
    audioEngine.attachNode(audioPlayerNode)
    let changePitchEffect = AVAudioUnitTimePitch()
    changePitchEffect.pitch = pitch
    audioEngine.attachNode(changePitchEffect)
    audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
    audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
    audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
    try! audioEngine.start()
    audioPlayerNode.play()
  }

  @IBAction func stopPlayingSound(sender: UIButton) {
    audioPlayer.stop()
  }
}
