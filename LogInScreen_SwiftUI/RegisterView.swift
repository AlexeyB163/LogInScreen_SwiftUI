//
//  RegisterView.swift
//  LogInScreen_SwiftUI
//
//  Created by User on 06.04.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName = ""
    @StateObject private var userManager = UserManager()
    @EnvironmentObject private var storage: StorageManager
    @State private var characterSymbols = 0
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter your login", text: $userName)
                    .multilineTextAlignment(.center)
                    .onChange(of: userName) { newValue in
                        characterSymbols = newValue.count
                    }
                    .padding(.leading, 28)
                Spacer()
                Text("\(characterSymbols)")
                    .foregroundColor(getColorCounter())
            }
            .padding()
            Button(action: {setUserName()}) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(getStatusButton())
        }
    }
    
    private func setUserName() {
        userManager.name = userName
        storage.save(login: userManager.name)
    }
    
    private func getColorCounter() -> Color {
        var color = Color(red: 200, green: 0, blue: 0)
        if userName.count >= 3 {
            color = Color(red: 0, green: 200, blue: 0)
        }
        return color
    }
    
    private func getStatusButton() -> Bool {
        userName.count >= 3 ? false : true
        }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

