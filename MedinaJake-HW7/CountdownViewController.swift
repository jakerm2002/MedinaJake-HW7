//
//  CountdownViewController.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//

import UIKit

class CountdownViewController: UIViewController {

    var timer: Timer?
    var timerIsRunning: Bool = false
    
    var queue: DispatchQueue!
    var delegate: UIViewController!
    var tableViewIndex: Int!
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queue = DispatchQueue(label: "timerQueue", qos: .utility)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let timerObj = timer {
            eventLabel.text = timerObj.event
            locationLabel.text = timerObj.location
            remainingTimeLabel.text = String(timerObj.remainingTime)
        }
    }
    
    func decrementTimer() {
        if let timerObj = self.timer {
            while self.timerIsRunning {
                if timerObj.remainingTime > 0 {
                    sleep(1)
                    timerObj.remainingTime -= 1
                    let newTime = String(timerObj.remainingTime)
                    DispatchQueue.main.async {
                        self.remainingTimeLabel.text = newTime
                    }
                } else {
                    timerIsRunning = false
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let timerObj = timer, timerObj.remainingTime > 0 {
            timerIsRunning = true
        }
        queue.async {
            self.decrementTimer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerIsRunning = false
        let otherVC = delegate as! TimerUpdater
        otherVC.updateTimer(index: tableViewIndex, newTimeValue: timer!.remainingTime)
    }
    
}
