//
//  ZoneViewModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/20/24.
//

import Foundation

class ZoneViewModel: ObservableObject {
    @Published var defaultMapZones: ZonesObject? = nil
    @Published var currentZone: ZoneObject? = nil
    @Published var creator: Creator? = nil
    @Published var error: Error? = nil
    
    func handleGetAllZones(adventureType: AdventureType) async {
        let zoneApiService = ZoneAPIService()
        
        zoneApiService.getDefaultZones(adventureType: adventureType) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let zonesData):
                    self.defaultMapZones = zonesData
                    self.error = nil
                case .failure(let error):
                    print(error)
                    self.defaultMapZones = nil
                    self.error = error
                }
            }
        }
    }
    
    func handleGetZone(zoneId: Int) async {
        let zoneApiService = ZoneAPIService()
        
        zoneApiService.getZone(zoneId: zoneId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let zoneData):
                    self.currentZone = zoneData
                    self.creator = Creator(id: self.currentZone!.creatorId, name: self.currentZone!.creatorName, email: self.currentZone!.creatorEmail, pictureUrl: self.currentZone!.creatorPictureUrl)
                    self.error = nil
                case .failure(let error):
                    print(error)
                    self.currentZone = nil
                    self.error = error
                }
            }
        }
    }
}

