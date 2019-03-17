//
//  ViewController.swift
//  Shipping Calc
//
//  Created by Ryan Besemer on 5/6/18.
//  Copyright © 2018 Ryan Besemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    var equals = false;
    var PALLETWEIGHT:Double = 33;
    var elevenOz:Double = 0.840 * 6;
    var fifteenOz:Double = 1.138 * 6;
    var thirtyTwoOz:Double = 2.354 * 6;
    var fiftyNineOz:Double = 4.138 * 4;
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var opLabel: UILabel!
    
    @IBOutlet weak var clear: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var pallets: UIButton!
    @IBOutlet weak var fiftyNine: UIButton!
    @IBOutlet weak var thirtyTwo: UIButton!
    @IBOutlet weak var fifteen: UIButton!
    @IBOutlet weak var eleven: UIButton!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        plus.setTitleColor(UIColor.white, for:.normal)
        minus.setTitleColor(UIColor.white, for:.normal)
        pallets.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for: .selected)
        fiftyNine.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
        thirtyTwo.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
        fifteen.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
        eleven.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
        
        if performingMath == true{
            label.text = String(sender.tag - 1);
            opLabel.text! += label.text!;
            numberOnScreen = Double(label.text!)!;
            performingMath = false
            
        } else if performingMath == false {
            if label.text == "0" {
                label.text = "";
            }
            if equals == true {
                label.text = "";
                opLabel.text = "";
                numberOnScreen = 0;
                previousNumber = 0;
                // equals = false;
            }
            
            label.text! += String(sender.tag - 1);
            opLabel.text! += String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!;
            
        }
    }

    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "0" && sender.tag != 11 && sender.tag != 19 {
            
            if sender.tag == 12 { //subtraction
                minus.setTitleColor(UIColor.red, for:.normal);
                if previousNumber == 0 {
                    previousNumber = numberOnScreen;
                    opLabel.text! += " - ";
                } else {
                    previousNumber -= numberOnScreen;
                    opLabel.text! += " - ";
                }
            }else if sender.tag == 13 { //addition
                plus.setTitleColor(UIColor.red, for:.normal);
                previousNumber += numberOnScreen;
                opLabel.text! += " + ";
            }
//            if sender.tag == 14 { //pallets
//                pallets.setTitleColor(UIColor.white, for:.normal)
//                previousNumber = numberOnScreen * PALLETWEIGHT;
//            }
//            if sender.tag == 15 { //59oz
//                fiftyNine.setTitleColor(UIColor.white, for:.normal)
//                previousNumber = numberOnScreen;
//            }
//            if sender.tag == 16 { //32oz
//                thirtyTwo.setTitleColor(UIColor.white, for:.normal)
//                previousNumber = numberOnScreen;
//            }
//            if sender.tag == 17 { //15.2oz
//                fifteen.setTitleColor(UIColor.white, for:.normal)
//                previousNumber = numberOnScreen;
//            }
//            if sender.tag == 18 { //11oz
//                eleven.setTitleColor(UIColor.white, for:.normal)
//                previousNumber = numberOnScreen;
//            }
            
            operation = sender.tag;
            performingMath  = true;
            
        } else if sender.tag == 11 { //clear
            label.text = "0";
            numberOnScreen = 0;
            previousNumber = 0;
            opLabel.text = "";
            performingMath = false;
            equals = false;
            plus.setTitleColor(UIColor.white, for:.normal)
            minus.setTitleColor(UIColor.white, for:.normal)
            pallets.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for: .selected)
            fiftyNine.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
            thirtyTwo.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
            fifteen.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
            eleven.setTitleColor(UIColor(red: 0.187, green: 0.227, blue: 0.156, alpha: 100), for:.selected)
            
        } else if sender.tag == 19 { //equals
            if operation == 19 {
                
            } else if operation == 12 { //subtraction
                minus.setTitleColor(UIColor.white, for:.normal)
                label.text = String(previousNumber - numberOnScreen);
                equals = true;
            } else if operation == 13 { //addition
                plus.setTitleColor(UIColor.white, for:.normal)
                label.text = String(previousNumber + numberOnScreen);
                equals = true;
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

