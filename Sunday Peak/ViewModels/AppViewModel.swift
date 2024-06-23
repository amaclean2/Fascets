//
//  AppViewModel.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/22/24.
//

import Foundation

class AppViewModel : ObservableObject {
    @Published var appPage: PageChoice = .explore
    @Published var zoneId: Int? = nil
    @Published var adventureId: Int? = nil
    
    func setPageChoice(newPage: PageChoice) {
        appPage = newPage
    }
    
    func setAdventureId(newId: Int) {
        adventureId = newId
    }
    
    func setZoneId(newId: Int) {
        zoneId = newId
    }
}
