//
//  AdventureViewModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/14/24.
//

import Foundation

class AdventureViewModel: ObservableObject {
    @Published var defaultMapAdventures: AdventuresObject? = nil
    @Published var globalAdventureType: AdventureType = .ski
    @Published var error: Error? = nil
    
    func handleGetAllAdventures(adventureType: AdventureType) {
        let adventureApiService = AdventureAPIService()
        
        adventureApiService.getDefaultAdventures(adventureType: adventureType) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let adventuresData):
                    self.defaultMapAdventures = adventuresData
                    self.error = nil
                case .failure(let error):
                    print(error)
                    self.defaultMapAdventures = nil
                    self.error = error
                }
            }
        }
    }
    
    func changeGlobalAdventureType(newType: AdventureType) {
        self.globalAdventureType = newType
    }
}
