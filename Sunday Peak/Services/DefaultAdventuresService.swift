//
//  DefaultAdventuresService.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import Foundation

extension AdventureAPIService {
    func getDefaultAdventures(adventureType: AdventureType, completion: @escaping (Result<AdventuresObject, Error>) -> Void) {
        let defaultAdventuresUrl = baseAdventureUrl.appendingPathComponent("/all")
        
        let queryParameters = [
            "type": adventureType.rawValue
        ]
        
        var urlComponents = URLComponents(url: defaultAdventuresUrl, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryParameters.map{ URLQueryItem(name: $0.key, value: $0.value)}
        
        guard let finalUrl = urlComponents?.url else {
            fatalError("Could not construct final url")
        }
        
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                let response = try decoder.decode(AllAdventuresResponse.self, from: data)
                
                let adventuresData = response.data
                completion(.success(adventuresData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
