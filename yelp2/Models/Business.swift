//
//  Business.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import Foundation

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String = ""
    var name: String = ""
    var alias: String = ""
    var imageUrl: String?
    var isClosed: Bool = true
    var url: String = ""
    var reviewCount: Int = 0
    var categories: [Category]?
    var rating: Double = 0
    var coordinates: Coordinate?
    var price: String = ""
    var location: Location?
    var phone: String = ""
    var displayPhone: String = ""
    var distance: Double = 0
    
    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case name
        case alias
        case url
        case categories
        case rating
        case coordinates
        case price
        case location
        case phone
        case distance
        
    }
    
    func getImageData() {
        
        // Check that image isn't nil
        guard imageUrl != nil else {
            return
        }
        
        // Download the data for the image
        if let url = URL(string: imageUrl!) {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil {
                    DispatchQueue.main.async {
                        //Set the image data
                        self.imageData = data!
                    }
                }
                
            })
            dataTask.resume()
        } // end if
    } // end getImageData()
    
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}

struct Location: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case address1
        case address2
        case address3
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
        
    }
    
}
