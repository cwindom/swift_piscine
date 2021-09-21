//
//  ViewController.swift
//  ex01
//
//  Created by OUT-Korogodova-MM on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonAction(_ sender: UIButton) {
        label.text = "Ты что, снова нажал?"
    }
    
}

