//
//  AddTimerViewController.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//

import UIKit

class AddTimerViewController: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var totalTimeTextField: UITextField!
    
    var delegate: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
