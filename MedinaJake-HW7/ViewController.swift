//
//  ViewController.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//
//  Project: MedinaJake-HW7
//  EID: jrm7784
//  Course: CS371L

import UIKit

// allows AddTimerVC to update us
protocol TimerAdder {
    func addTimer(newTimer: Timer)
}

// allows CountdownVC to update us
protocol TimerUpdater {
    func updateTimer(index: Int, newTimeValue: Int)
}

class ViewController: UIViewController, TimerAdder, TimerUpdater, UITableViewDelegate, UITableViewDataSource {

    var timers: [Timer] = []
    
    let addTimerSegueIdentifier = "AddTimerSegueIdentifier"
    let countdownSegueIdentifier = "CountdownSegueIdentifier"
    let timerCellIdentifier = "TimerTable-ViewCellIdentifier"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: timerCellIdentifier, for: indexPath) as! TimerTable_ViewCell
        cell.eventLabel.text = timers[row].event
        cell.locationLabel.text = timers[row].location
        cell.remainingTimeLabel.text = String(timers[row].remainingTime)
        return cell
    }
    
    // goto CountdownVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: countdownSegueIdentifier, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // allows AddTimerVC to update us
    func addTimer(newTimer: Timer) {
        timers.append(newTimer)
        tableView.reloadData()
    }
    
    // allows CountdownVC to update us
    func updateTimer(index: Int, newTimeValue: Int) {
        timers[index].remainingTime = newTimeValue
        tableView.reloadData()
    }
    
    // send required info to view controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addTimerSegueIdentifier,
            let destination = segue.destination as? AddTimerViewController
        {
            destination.delegate = self
        } else if segue.identifier == countdownSegueIdentifier,
            let destination = segue.destination as? CountdownViewController,
            let index = tableView.indexPathForSelectedRow?.row
        {
            destination.timer = timers[index]
            destination.tableViewIndex = index
            destination.delegate = self
        }
    }

}

