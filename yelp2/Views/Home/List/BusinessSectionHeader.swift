//
//  BusinessSectionHeader.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
            
        }
        
    }
}


