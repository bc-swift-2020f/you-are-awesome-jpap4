//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by John Pappas on 9/1/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 10
    let totalNumberofSounds = 6
    
    var audioPlayer: AVAudioPlayer!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription) Couldn't read data from sound file")
            }
        } else {
            print("Error: Couldn't read data from sound file")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }
    
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "Fabulous? That's You!",
                        "You've Got The Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberofSounds-1)
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")
        }
        
    }
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil {
                 audioPlayer.stop()
        }
    }
}

