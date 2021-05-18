//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Simon Alam on 17.05.21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 
    @IBOutlet var header: UILabel!
    @IBOutlet var result: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var viewColor: UIView!
    var fToC = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewColor.backgroundColor = UIColor(red: 0.35, green: 0.66, blue: 0.59, alpha: 1.00)
        viewColor.layer.cornerRadius = 30
        textField.delegate = self
        textField.layer.cornerRadius = 20
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           //tap.cancelsTouchesInView = false

           view.addGestureRecognizer(tap)
    }

   
    @IBAction func swap(_ sender: UIButton) {
        if fToC {
            UIView.animate(withDuration: 0.5) {
                self.viewColor.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.63, alpha: 1.00)
            }
            
            
            header.text = "Convert °C to °F"
        } else {
            header.text = "Convert °F to °C "
            
            
            UIView.animate(withDuration: 0.5) {
                self.viewColor.backgroundColor = UIColor(red: 0.35, green: 0.66, blue: 0.59, alpha: 1.00)
                
            }
        }
        
        textField.text = ""
        result.text = "0"
        
        fToC.toggle()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        if fToC {
            if let text = Double(textField.text!) {
                let resultt = (text - 32) * (5/9)
                result.text = String(format: "%.1f", resultt)
                
                
            }
        } else {
            if let text = Double(textField.text!) {
                let resultt = text * 1.8 + 32
                result.text = String(format: "%.1f", resultt)
            }
        }
    }
    
}

