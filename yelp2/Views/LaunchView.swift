//
//  LaunchView.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the auth status of geolocation
        
        if model.authorizationState == .notDetermined {
            // If undetermined
        } else if model.authorizationState == CLAuthorizationStatus.authorizedAlways || model.authorizationState == CLAuthorizationStatus.authorizedWhenInUse {
            // If approved
            HomeView()
            
        } else {
        // If denied
        }
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
