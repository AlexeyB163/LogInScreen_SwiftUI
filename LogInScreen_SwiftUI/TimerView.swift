//
//  TimerView.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 07.04.2022.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject var storage: StorageManager
    
    var body: some View {
        VStack {
            Text("Hi, \(storage.login)! ")
                .font(.largeTitle)
                .padding(.top,20)
                .padding(.bottom, 30)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.bottom, 100)
            ButtonStartView(timer: timer)
            Spacer()
            ButtonLogOutView(storage: $storage.login)
                .padding(.bottom, 40)
        }
    }
}

struct ButtonStartView: View {
    @ObservedObject var timer:TimeCounter
    
    var body: some View {
        Button(action: {timer.startTimer()}) {
            Text(timer.buttonTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(width: 150, height: 40)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 3))
        .background(Color.red)
        .cornerRadius(15)
    }
}

struct ButtonLogOutView: View {
    @Binding var storage: String
    
    var body: some View {
        Button(action: {logOut()}) {
            Text("LogOut")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(width: 150, height: 40)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 3))
        .background(Color.blue)
        .cornerRadius(15)
    }
    
    private func logOut(){
        storage = ""
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
