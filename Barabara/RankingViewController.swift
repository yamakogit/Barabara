//
//  RankingViewController.swift
//  Barabara
//
//  Created by 山田航輝 on 2024/05/09.
//

import UIKit

class RankingViewController: UIViewController {
    
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!

    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingLabel1.text = String(saveData.integer(forKey: "score1"))
        rankingLabel2.text = String(saveData.integer(forKey: "score2"))
        rankingLabel3.text = String(saveData.integer(forKey: "score3"))
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }


}

