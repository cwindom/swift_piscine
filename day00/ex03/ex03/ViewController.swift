//
//  ViewController.swift
//  ex03
//
//  Created by OUT-Korogodova-MM on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    var a: Double?
    var b: Double?
    var result: Double?
    var sign: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Double.greatestFiniteMagnitude)
    }
    
    func checkMaxMin() {
        guard var result = self.result else {
            return
        }
        if (result > Double.greatestFiniteMagnitude) {
            result = Double.greatestFiniteMagnitude
            
        }
        if (result < Double.greatestFiniteMagnitude) {
            result = -Double.greatestFiniteMagnitude
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "AC":
            a = nil
            b = nil
            result = nil
            label.text = "0"
            print("AC")
        case "NEG":
            print("NEG")
        case "/":
            sign = "/"
            print("/")
        case "*":
            sign = "*"
            print("*")
        case "-":
            sign = "-"
            print("-")
        case "+":
            sign = "+"
            print("+")
        case "=":
            checkMaxMin()
            if b != nil && a != nil && sign == "+" {
                result = a! + b!
            } else
            if b != nil && a != nil && sign == "*" {
                result = a! * b!
            } else
            if b != nil && a != nil && sign == "-" {
                result = a! - b!
            } else
            if b != nil && a != nil && sign == "/" {
                if b == 0 {
                    label.text = "Ошибка"
                    break
                }
                result = a! / b!
            }
            if b == nil && a != nil && sign == "NEG" {
                result = -a!
            }
            guard let result = self.result else {
                return
            }
            label.text = String(result)
            print("=")
        default:
            break
        }
    }
    
    @IBAction func number(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "0":
            label.text = "0"
            if (a == nil) {
                a = 0
                break
            }
            if b == nil {
                b = 0
            }
            print("0")
        case "1":
            label.text = "1"
            if (a == nil) {
                a = 1
                break
            }
            if b == nil {
                b = 1
            }
            print("1")
        case "2":
            label.text = "2"
            if (a == nil) {
                a = 2
                break
            }
            if b == nil {
                b = 2
            }
            print("2")
        case "3":
            label.text = "3"
            if (a == nil) {
                a = 3
                break
            }
            if b == nil {
                b = 3
            }
            print("3")
        case "4":
            label.text = "4"
            if (a == nil) {
                a = 4
                break
            }
            if b == nil {
                b = 4
            }
            print("4")
        case "5":
            label.text = "5"
            if (a == nil) {
                a = 5
                break
            }
            if b == nil {
                b = 5
            }
            print("5")
        case "6":
            label.text = "6"
            if (a == nil) {
                a = 6
                break
            }
            if b == nil {
                b = 6
            }
            print("6")
        case "7":
            label.text = "7"
            if (a == nil) {
                a = 7
                break
            }
            if b == nil {
                b = 7
            }
            print("7")
        case "8":
            label.text = "8"
            if (a == nil) {
                a = 8
                break
            }
            if b == nil {
                b = 8
            }
            print("8")
        case "9":
            label.text = "9"
            if (a == nil) {
                a = 9
                break
            }
            if b == nil {
                b = 9
            }
            print("9")
        default:
            break
        }
    }
}

