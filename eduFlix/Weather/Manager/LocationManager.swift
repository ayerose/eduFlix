//
//  LocationManager.swift
//  eduFlix
//
//  Created by Reya on 19.04.22.
//

import Foundation
import CoreLocation



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // creares an instance of CLLocationManage to get  coordinates
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        
        // Assign delegate to  CLLocationManager instance
        manager.delegate = self
    }
    

    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Set  location coordinates to  location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    
    // error handling
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}

