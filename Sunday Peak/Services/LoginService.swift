//
//  LoginService.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/12/24.
//

import Foundation

extension UserAPIService {
    func loginUser(email: String, pass: String, completion: @escaping (Result<User, Error>) -> Void) {
        let loginURL = baseUserUrl.appendingPathComponent("/login")
        let loginData = LoginData(email: "andrew.n.maclean@gmail.com", password: "BigSkiing.", native: true)
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let requestData = try JSONEncoder().encode(loginData)
            request.httpBody = requestData
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(LoginResponse.self, from: data)
                
                let token = response.data.token
                self.keychain["authToken"] = token
                
                let userData = response.data.user
                completion(.success(userData))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
