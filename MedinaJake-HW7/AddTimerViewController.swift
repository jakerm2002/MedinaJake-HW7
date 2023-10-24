//
//  AddTimerViewController.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//
//  Project: MedinaJake-HW7
//  EID: jrm7784
//  Course: CS371L

import UIKit

class AddTimerViewController: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var totalTimeTextField: UITextField!
    
    // set by main VC, allows us to send back the new timer
    var delegate: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let timer = Timer(
            event: eventTextField.text!,
            location: locationTextField.text!,
            remainingTime: Int(totalTimeTextField.text!)!
        )
        let otherVC = delegate as! TimerAdder
        otherVC.addTimer(newTimer: timer)
    }
}
