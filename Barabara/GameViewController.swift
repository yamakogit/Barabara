//
//  GameViewController.swift
//  Barabara
//
//  Created by 山田航輝 on 2024/05/09.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let saveData: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]
    var dx: [CGFloat] = [1.0, 0.5, -1.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        positionX = [width/2, width/2, width/2]
        start()
        
    }
    
    
    @objc func up() {
        for i in 0..<3 {
            
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * -1
            }
            
            positionX[i] += dx[i]
        }
        
        imageView1.center.x = positionX[0]
        imageView2.center.x = positionX[1]
        imageView3.center.x = positionX[2]
    }
    
    @IBAction func stop() {
        if timer.isValid == true {
            timer.invalidate() //タイマー停止
        }
        
        for i in 0..<3 {
            score = score - abs(Int(width/2 - positionX[i])) * 2
        }
        
        resultLabel.text = "Score: \(score)"
        resultLabel.isHidden = false
        
        let highScore1: Int = saveData.integer(forKey: "score1")
        let highScore2: Int = saveData.integer(forKey: "score2")
        let highScore3: Int = saveData.integer(forKey: "score3")
        
        if score > highScore1 {
            saveData.set(score, forKey: "score1")
            saveData.set(highScore1, forKey: "score2")
            saveData.set(highScore2, forKey: "score3")
        } else if score > highScore2 {
            saveData.set(score, forKey: "score2")
            saveData.set(highScore1, forKey: "score3")
        } else if score > highScore3 {
            saveData.set(score, forKey: "score3")
        }
        
    }
    
    
    
    
    
    
    @IBAction func retry() {
        score = 1000
        positionX = [width/2, width/2, width/2]
        
        if timer.isValid == false {
            self.start() //Startメソッド呼び出し
        }
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

    func start() {
        
        resultLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        
    }
    
    
}

