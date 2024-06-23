//
//  GetZoneService.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/20/24.
//

import Foundation

extension ZoneAPIService {
    func getZone(zoneId: Int, completion: @escaping (Result<ZoneObject, Error>) -> Void) {
        let getZoneUrl = baseZoneUrl.appendingPathComponent("/details")
        
        let queryParameters = [
            "zone_id": "\(zoneId)"
        ]
        
        var urlComponents = URLComponents(url: getZoneUrl, resolvingAgainstBaseURL: false)
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
                let response = try decoder.decode(ZoneResponse.self, from: data)
                
                let zoneData = response.data.zone
                completion(.success(zoneData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
