//
//  DefaultZoneService.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/20/24.
//

import Foundation

extension ZoneAPIService {
    func getDefaultZones(adventureType: AdventureType, completion: @escaping (Result<ZonesObject, Error>) -> Void) {
        let defaultZonesUrl = baseZoneUrl.appendingPathComponent("/all")
        
        let queryParameters = [
            "type": adventureType.rawValue
        ]
        
        var urlComponents = URLComponents(url: defaultZonesUrl, resolvingAgainstBaseURL: false)
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
                let response = try decoder.decode(AllZonesResponse.self, from: data)
                
                let zonesData = response.data
                completion(.success(zonesData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
