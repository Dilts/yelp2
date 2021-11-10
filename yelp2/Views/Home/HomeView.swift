//
//  HomeView.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                if !isMapShowing {
                    
                    // Show List
                    VStack(alignment: .leading) {
                        
                        HStack{
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to Map View") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        BusinessList()
                        
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                    
                } else {
                    // Show map
                    BusinessMap()
                        .ignoresSafeArea()
                }
            }
            
        } else {
            ProgressView() //Spinner if things are still loading
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
