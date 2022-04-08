//
//  LogInScreen_SwiftUIApp.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 06.04.2022.
//

import SwiftUI

@main
struct LogInScreen_SwiftUIApp: App {
    
    @StateObject var storage = StorageManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storage)
        }
    }
}
