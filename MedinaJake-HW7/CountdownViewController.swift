//
//  CountdownViewController.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//
//  Project: MedinaJake-HW7
//  EID: jrm7784
//  Course: CS371L

import UIKit

class CountdownViewController: UIViewController {

    // will be set by main VC during segue
    var timer: Timer!
    var timerIsRunning: Bool = false
    
    // set by main VC, allows us to send back the new timer
    var delegate: UIViewController!
    var queue: DispatchQueue!
    
    // index of table view cell to update
    var tableViewIndex: Int!
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // high priority because we need the time displayed to be accurate
        queue = DispatchQueue(label: "timerQueue", qos: .userInteractive)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventLabel.text = timer.event
        locationLabel.text = timer.location
        remainingTimeLabel.text = String(timer.remainingTime)
    }
    
    // decrement timer and update UI
    func decrementTimer() {
        while self.timerIsRunning {
            if self.timer.remainingTime > 0 {
                sleep(1)
                self.timer.remainingTime -= 1
                let newTime = String(self.timer.remainingTime)
                DispatchQueue.main.async {
                    self.remainingTimeLabel.text = newTime
                }
            } else {
                timerIsRunning = false
            }
        }
    }
    
    // re–start timer
    override func viewDidAppear(_ animated: Bool) {
        if timer.remainingTime > 0 {
            timerIsRunning = true
        }
        queue.async {
            self.decrementTimer()
        }
    }
    
    // stop timer on exit
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerIsRunning = false
        let otherVC = delegate as! TimerUpdater
        otherVC.updateTimer(index: tableViewIndex, newTimeValue: timer!.remainingTime)
    }
    
}
