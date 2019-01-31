//
//  changeGemViewController.swift
//  changeGemGesture
//
//  Created by Chang Sophia on 1/26/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation
var newGems: ArraySlice<String> = []
var twinkleMove: Timer?
var player: AVPlayer?


class changeGemViewController: UIViewController {
    @IBOutlet weak var gloveImageView: UIImageView!
    @IBOutlet weak var redImageView: UIImageView!
    @IBOutlet weak var orangeImageView: UIImageView!
    @IBOutlet weak var greenImageView: UIImageView!
    @IBOutlet weak var blueImageView: UIImageView!
    @IBOutlet weak var purpleImageView: UIImageView!
    @IBOutlet weak var crystalImageView: UIImageView!
    @IBOutlet weak var twinkleButton: UIButton!
    
    
    @IBAction func gloveSwith(_ sender: UISwitch) {
      
       if sender.isOn == true {
        gloveImageView.image = UIImage(named: "Thanos")
        redImageView.frame = CGRect(x:131, y:192, width:40, height:40)
        orangeImageView.frame = CGRect(x:88, y:202, width:40, height:40)
        greenImageView.frame = CGRect(x:295, y:294, width:40, height:40)
        blueImageView.frame = CGRect(x:179, y:194, width:40, height:40)
        purpleImageView.frame = CGRect(x:225, y:194, width:40, height:40)
        crystalImageView.frame = CGRect(x:145, y:260, width:60, height:60)
       } else if sender.isOn == false{
        gloveImageView.image = UIImage(named: "gloves")
        
        redImageView.frame = CGRect(x:108, y:152, width:50, height:50)
        orangeImageView.frame = CGRect(x:45, y:203, width:50, height:50)
        greenImageView.frame = CGRect(x:292, y:300, width:50, height:50)
        blueImageView.frame = CGRect(x:179, y:147, width:50, height:50)
        purpleImageView.frame = CGRect(x:237, y:164, width:50, height:50)
        crystalImageView.frame = CGRect(x:156, y:270, width:70, height:70)
        
        }
    }
    
    
    let gems = ["red", "orange", "blue", "green", "purple", "crystal"]
    
    @IBAction func twinkeButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "Twinkle" {
            twinkleGem()
            sender.setTitle("Stop", for: UIControl.State.normal)
        } else if sender.currentTitle == "Stop" {
           twinkleMove?.invalidate()
            sender.setTitle("Twinkle", for: UIControl.State.normal)
         
        }
        
            
        }
    @IBAction func snapButtonPressed(_ sender: UIButton) {
        changeGem()
    }

    
    func changeGem(){
        
        newGems = self.gems.shuffled()[0...5]
        self.redImageView.image = UIImage(named: newGems[0])
        self.orangeImageView.image = UIImage(named: newGems[1])
        self.blueImageView.image = UIImage(named: newGems[2])
        self.greenImageView.image = UIImage(named: newGems[3])
        self.purpleImageView.image = UIImage(named: newGems[4])
        self.crystalImageView.image = UIImage(named: newGems[5])
        
        let shakeMusic = Bundle.main.url(forResource: "DoReMeSo", withExtension: "mov")!
        player = AVPlayer(url: shakeMusic)
        player?.play()
    }


    func twinkleGem(){
        twinkleMove = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true, block: {(_)in
            self.changeGem()
        }
    )}
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == UIEvent.EventSubtype.motionShake{
       changeGem()
    }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
        
    
    }

