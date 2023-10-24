//
//  Timer.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//
//  Project: MedinaJake-HW7
//  EID: jrm7784
//  Course: CS371L

import Foundation

// represents a single timer
class Timer {
    
    var event: String
    var location: String
    var remainingTime: Int
    
    init(event: String, location: String, remainingTime: Int) {
        self.event = event
        self.location = location
        self.remainingTime = remainingTime
    }
    
}
