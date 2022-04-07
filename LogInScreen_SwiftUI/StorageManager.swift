//
//  StorageManager.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 07.04.2022.
//

import Foundation
import Combine

final class StorageManager: ObservableObject{
    @Published var userDefaults = UserDefaults.standard
    let key = "login"
    @Published var isRegistered = false
    
}
extension StorageManager {
    func save(login: String) {
        var savedData = fetchLogin()
        savedData = login
        userDefaults.set(savedData, forKey: key)
        isRegistered = true
    }
    
    func fetchLogin() -> String {
        guard let savedData = userDefaults.string(forKey: key) else { return "" }
        return savedData
    }
    
    func delete() {
        var savedData = fetchLogin()
        savedData = ""
        userDefaults.set(savedData, forKey: key)
        isRegistered = false
    }
}
