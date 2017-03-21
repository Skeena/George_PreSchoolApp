//
//  ViewController.swift
//  George_PreSchoolApp
//
//  Created by George Schena on 30/01/2017.
//  Copyright © 2017 GS International. All rights reserved.
//

import UIKit
import AVFoundation

var backgroundMusicPlayer = AVAudioPlayer()

func playBackgroundMusic(filename: String){
    let url = Bundle.main.url(forResource: "Music", withExtension: "wav")
    guard let newURL = url else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    } catch let error as NSError {
        print(error.description)
    }
    
}

class ViewController: UIViewController {
    
    var audioPlayerCorrect = AVAudioPlayer()
    var audioPlayerWrong = AVAudioPlayer()

    var MyNumbers = [0, 1, 2, 3, 4]
    
    var Num1 = 0
    var Num2 = 0
    var total = 0
    var replay = true
    

    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionMark: UILabel!
    @IBOutlet weak var congratsView: UIView!
    @IBOutlet weak var congratsResultsLabel: UILabel!
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playBackgroundMusic(filename: "Music")
        
        congratsView.isHidden = true
        
        Num1 = MyNumbers[Int(arc4random_uniform(4))]
        Num2 = MyNumbers[Int(arc4random_uniform(4))]
        
        total = Num1 + Num2
        resultLabel.text = "\(Num1) + \(Num2) = "
        congratsResultsLabel.text = "\(Num1) + \(Num2) = \(total)"

        
        let musicWrong = Bundle.main.path(forResource: "Incorrect_2.0", ofType: "wav")
        do {
            audioPlayerWrong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicWrong!))
        }
        catch{
            print(error)
        }
        
        
        let musicCorrect = Bundle.main.path(forResource: "Correct_2.0", ofType: "wav")
        do {
            audioPlayerCorrect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicCorrect!))
        }
        catch{
            print(error)
        }
        

        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Button0(_ sender: UIButton) {
        if total == 0{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 0 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
            })
            
            
        }

            
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()
            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    self.questionMark.textColor = UIColor.white
                }
            })
        }
        
        
    }
    
    @IBAction func Number1(_ sender: UIButton) {
        if total == 1{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 1 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2

            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
            
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()
            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    
    @IBAction func Button2(_ sender: UIButton) {
        if total == 2{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 2 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()
            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x , y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button3(_ sender: UIButton) {
        if total == 3{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 3 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
            
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x , y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button4(_ sender: UIButton) {
        if total == 4{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 4 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button5(_ sender: UIButton) {
        if total == 5{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 5 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button6(_ sender: UIButton) {
        if total == 6{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 6 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button7(_ sender: UIButton) {
        if total == 7{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 7 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2
            
            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })

        }

    }
    @IBAction func Button8(_ sender: UIButton) {
        if total == 8{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 8 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2

            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {
            questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })

                }
            })
        }

    }
    @IBAction func Button9(_ sender: UIButton) {
        if total == 9{
            congratsResultsLabel.text = "\(Num1) + \(Num2) = 9 "
            audioPlayerCorrect.play()
            Num1 = MyNumbers[Int(arc4random_uniform(4))]
            Num2 = MyNumbers[Int(arc4random_uniform(4))]
            
            total = Num1 + Num2

            congratsView.isHidden = false
            resultLabel.text = "\(Num1) + \(Num2) = "
            questionMark.textColor = UIColor.white
            
            self.star1.alpha = 0
            self.star2.alpha = 0
            self.star3.alpha = 0
            self.star4.alpha = 0
            self.star5.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.star1.alpha = 1.0
                self.star2.alpha = 1.0
                self.star3.alpha = 1.0
                self.star4.alpha = 1.0
                self.star5.alpha = 1.0
                
            })
            
            
        }
        else
        {

            self.questionMark.textColor = UIColor.red
            audioPlayerWrong.play()

            
            let bounds = questionMark.bounds
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.questionMark.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width + 2.5, height: bounds.size.height)
            }, completion: { (success: Bool) in
                if success{
                    self.questionMark.bounds = bounds
                    UIView.animate(withDuration: 1, animations: {
                        self.questionMark.textColor = UIColor.white
                    })
                
                    
                    
                }
            })
                }
            }
    
    @IBAction func replayButton(_ sender: UIButton) {
        replay = true
        if replay == true{
            
            congratsView.isHidden = true
            
            
        }
        
    }
}





