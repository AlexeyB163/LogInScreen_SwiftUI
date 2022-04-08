//
//  StorageManager.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 07.04.2022.
//

import SwiftUI
import Combine

final class StorageManager: ObservableObject {
    @AppStorage("login") var login = ""
}
