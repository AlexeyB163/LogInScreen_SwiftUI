//
//  ContentView.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 06.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var storage: StorageManager
    var body: some View {
        Group {
            if !storage.login.isEmpty {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


