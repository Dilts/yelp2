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
        Section(header: BusinessSectionHeader(title: title)) {
            ForEach(businesses) { business in
                
                NavigationLink(destination: BusinessDetail(business: business)) {
                    BusinessRow(business: business)
                }
            }
        }
    }
}


