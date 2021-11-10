//
//  BusinessRow.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                // Image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(8)
                    .scaledToFit()
                
                //Name and distance
                VStack(alignment: .leading) {
                    Text(business.name)
                        .bold()
                    Text(String(format: "%.1f km away", business.distance/1000 ))
                        .font(.caption)
                }
                
                Spacer()
                
                //Rating and number of reviews
                VStack(alignment: .leading) {
                    Image("regular_\(business.rating)")
                    Text("\(business.reviewCount) Reviews")
                        .font(.caption)
                }
            }
            Divider()
        }
        .foregroundColor(.black)
        
    }
}


