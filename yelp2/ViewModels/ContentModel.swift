//
//  ContentModel.swift
//  yelp2
//
//  Created by Brian Dilts on 11/4/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    override init() {
        
        // Init methode of NSObject
        super.init()
        
        // Set the content model as the delegate of the lcoation manager
        
        locationManager.delegate = self
        
        // Request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        
    }
    
    // MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have permission, start geolocating the user
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied || locationManager.authorizationStatus == .restricted {
            // We dont have permission, handle with popup
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Gives us the location of the user
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // Stop requesting location after get it once
            locationManager.stopUpdatingLocation()
            
            // Send into Yelp API
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            
        }
//        print(locations.first ?? "no location")
        
        
    }
    
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create URL
        var urlComponents = URLComponents(string: Constants.apiURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category)
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // Get URL Session
            let session = URLSession.shared
            
            // Create the Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    do{
                        // Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            
                            /*
                            // Assign results to appropriate property
                            if category == Constants.sightsKey {
                                self.sights = result.businesses
                            } else if category == Constants.restaurantsKey {
                                self.restaurants = result.businesses
                            }*/
                            
                            switch category {
                            case Constants.sightsKey:
                                self.sights = result.businesses
                            case Constants.restaurantsKey:
                                self.restaurants = result.businesses
                            default:
                                break
                            }
                            print(result)
                        }
                    }
                    catch {
                        print(error)
                    }
                    
                }
                
            }
            
            // Start the Data Task
            dataTask.resume()
            
        }
        
        
        
        
    }
    
    
}
