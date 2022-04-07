//
//  ContentView.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 06.04.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var storage: StorageManager

    var body: some View {
        Group {
            if !storage.fetchLogin().isEmpty {
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


