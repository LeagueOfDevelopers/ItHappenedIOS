//
//  TrackingDataSource.swift
//  ItHappened
//
//  Created by Victor on 07/12/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation

class TrackingDataSource : TrackingDataSourceProtocol {
    func getTracking(trackingID: UUID) -> Tracking {
        <#code#>
    }
    
    func getTrackingCollection() -> [Tracking] {
        <#code#>
    }
    
    func createTracking(tracking: Tracking) {
        <#code#>
    }
    
    func filterEvents(trackingsID: [UUID], fromDate: Date, toDate: Date, scaleComparison: Comparison, scale: Double, ratingComparison: Comparison, rating: Rating, indexFrom: Int, indexTo: Int) -> [Event] {
        <#code#>
    }
    
    func updateTrackingCollection(trackingCollection: [Tracking]) {
        <#code#>
    }
    
    func setUserID(userID: UUID) {
        <#code#>
    }
    
    func getEvent(eventID: UUID) {
        <#code#>
    }
    
    func deleteEvent(eventID: UUID) {
        <#code#>
    }
    
    func deleteTracking(trackingID: UUID) {
        <#code#>
    }
    
    func updateEvent(event: Event) {
        <#code#>
    }
    
    func updateTracking(tracking: Tracking) {
        <#code#>
    }
    
    func createEvent(trackingID: UUID, newEvent: Event) {
        <#code#>
    }
    
    func getEventCollection(trackingID: UUID) -> [Event] {
        <#code#>
    }
    
    
}
