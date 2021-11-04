//
//  BusinessSearch.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    var center = Coordinate()
    
}
