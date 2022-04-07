//
//  TimeCounter.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 06.04.2022.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var timer: Timer?
    var counter = 3
    var buttonTitle = "Start"
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(checkValue),
            userInfo: nil,
            repeats: true)
        didTapButton()
    }
    
    @objc private func checkValue() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
            
        }
        objectWillChange.send(self)
    }
    
    private func killTimer(){
        timer?.invalidate()
        timer = nil
    }
    
     private func didTapButton(){
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
}
