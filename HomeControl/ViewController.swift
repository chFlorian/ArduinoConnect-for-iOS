//
//  ViewController.swift
//  HomeControl
//
//  Created by florian schweizer on 24.04.17.
//  Copyright © 2017 florian schweizer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var DPinLbl: UILabel!
    @IBOutlet weak var IPv4TextField: UITextField!
    
    var pin: Int = 0
    var ip: String = "192.168.2.127"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IPv4TextField.text = ip
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func DOffPressed(_ sender: UIButton) {
        let task = URLSession.shared.dataTask(with: URL(string: "http://\(ip)/pin\(pin)off")!)
        task.resume()
    }
    
    @IBAction func DOnPressed(_ sender: UIButton) {
        let task = URLSession.shared.dataTask(with: URL(string: "http://\(ip)/pin\(pin)on")!)
        task.resume();
    }
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        pin = Int(sender.value)
        DPinLbl.text = String(pin)
    }
    
    @IBAction func UpdateButtonPressed(_ sender: UIButton) {
        ip = IPv4TextField.text!
    }
}

