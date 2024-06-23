//
//  ExploreView.swift
//  Sunday Peak
//
//  Created by Andrew Maclean on 6/11/24.
//

import SwiftUI
@_spi(Experimental) import MapboxMaps

struct ExploreView: View {
    @EnvironmentObject private var zoneViewModel: ZoneViewModel
    @EnvironmentObject private var appViewModel: AppViewModel
    
    var body: some View {
        let center = CLLocationCoordinate2D(latitude: 39.32, longitude: -120.17)
        MapReader { proxy in
            Map(initialViewport: .camera(center: center, zoom: 12, bearing: 0, pitch: 0))
                .mapStyle(.outdoors)
                .onStyleLoaded { _ in
                    guard let map = proxy.map else { return }
                    try! setupZonesLayer(map, zoneDefaultData: (zoneViewModel.defaultMapZones?.zones.ski)!)
                }
                .onLayerTapGesture("zone-default-layer") { feature, _ in
                    guard let zoneId = getZoneIdFromFeature(feature: feature) else {
                        print("get zoneId failed")
                        return true
                    }
                    
                    appViewModel.setZoneId(newId: zoneId)
                    appViewModel.setPageChoice(newPage: .adventure)
                    
                    return true
                }
                .edgesIgnoringSafeArea(.top)
        }
    }
}

private func getZoneIdFromFeature(feature: QueriedFeature) -> Int? {
    
    guard let identifier = feature.feature.identifier?.rawValue else {
        print("Could not get identifier")
        return nil
    }
    
    if let intZoneId = identifier as? Int {
        return intZoneId
    } else if let stringZoneId = identifier as? String, let intZoneId = Int(stringZoneId) {
        return intZoneId
    } else if let doubleZoneId = identifier as? Double {
        return Int(doubleZoneId)
    } else {
        return nil
    }
}

private func setupZonesLayer(_ map: MapboxMap, zoneDefaultData: FeatureCollection) throws {
    let image = UIImage(named: "SkiIcon")!.withRenderingMode(.alwaysTemplate)
    
    try! map.addImage(image, id: "ski")
    
    var newZoneSource = GeoJSONSource(id: "zone-default-source")
    newZoneSource.data = .featureCollection(zoneDefaultData)
    
    var pointsLayer = SymbolLayer(id: "zone-default-layer", source: "zone-default-source")
    pointsLayer.iconImage = .constant(.name("ski"))
    pointsLayer.iconSize = .constant(0.4)
    
    try map.addSource(newZoneSource)
    try map.addLayer(pointsLayer)
}
