//
//  BusinessSection.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: "Restaurants")) {
            ForEach(businesses) { business in
                Text(business.name ?? "")
                Divider()
            }
        }
    }
}


