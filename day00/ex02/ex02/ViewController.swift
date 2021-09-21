//
//  ViewController.swift
//  ex02
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
    @IBAction func operation(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "AC":
            print("AC")
        case "NEG":
            print("NEG")
        case "/":
            print("/")
        case "*":
            print("*")
        case "-":
            print("-")
        case "+":
            print("+")
        case "=":
            print("=")
        default:
            break
        }
    }
    @IBAction func number(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "0":
            label.text = "0"
            print("0")
        case "1":
            label.text = "1"
            print("1")
        case "2":
            label.text = "2"
            print("2")
        case "3":
            label.text = "3"
            print("3")
        case "4":
            label.text = "4"
            print("4")
        case "5":
            label.text = "5"
            print("5")
        case "6":
            label.text = "6"
            print("6")
        case "7":
            label.text = "7"
            print("7")
        case "8":
            label.text = "8"
            print("8")
        case "9":
            label.text = "9"
            print("9")
        default:
            break
        }
    }
    
}

