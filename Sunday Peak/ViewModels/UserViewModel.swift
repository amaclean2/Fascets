//
//  UserViewModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/12/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var loggedInUser: User? = nil
    @Published var workingUser: User? = nil
    @Published var error: Error? = nil
    
    func handleLogin(email: String, pass: String) {
        let userApiService = UserAPIService()
        
        userApiService.loginUser(email: email, pass: pass) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let userData):
                    self.loggedInUser = userData
                    self.workingUser = userData
                    self.error = nil
                case .failure(let error):
                    print(error)
                    self.loggedInUser = nil
                    self.workingUser = nil
                    self.error = error
                }
            }
        }
    }
}
