//
//  ViewController.swift
//  Xylophone
//
//  Created by Oko-osi Korede on 27/01/2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        setupAudioPlayer(title: sender.currentTitle)
        sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(1)
        }
        
    }
    
    func setupAudioPlayer(title: String?) {
        guard let title,
              let url = Bundle.main.url(forResource: title, withExtension: "wav") else {
            print("Sound file not found.")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let audioPlayer else {
                print("AudioPlayer not found.")
                return
            }
            audioPlayer.play()
        } catch {
            print("Error loading sound file: \(error.localizedDescription)")
        }
    }
}

