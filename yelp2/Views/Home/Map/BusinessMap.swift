//
//  BusinessMap.swift
//  yelp2
//
//  Created by Brian Dilts on 11/10/21.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        // Show user on map
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        //TODO: Set region
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
    
}

