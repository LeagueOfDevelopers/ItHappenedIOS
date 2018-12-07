//
//  TrackingDataSource.swift
//  ItHappened
//
//  Created by Victor on 07/12/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation

class TrackingDataSource : TrackingDataSourceProtocol {
    //MARK: Initialization
    private var trackingCollection : [Tracking]
    init(trackingCollection : [Tracking]){
        self.trackingCollection = trackingCollection
    }
    //MARK: Errors
    enum error : Error{
        case IllegalArgumentException(String)
    }
    //MARK: Functions
    func getTracking(trackingID: UUID) throws -> Tracking {
        guard let tracking = trackingCollection.first(where: {$0.trackingId == trackingID}) else {
            throw error.IllegalArgumentException("Tracking not exist")
        }
        return tracking
    }
    
    func getTrackingCollection() -> [Tracking] {
        return trackingCollection
    }
    
    func createTracking(tracking: Tracking) {
        trackingCollection.append(tracking)
    }
    
    func filterEvents(trackingsID: [UUID], fromDate: Date, toDate: Date, scaleComparison: Comparison, scale: Double, ratingComparison: Comparison, rating: Rating, indexFrom: Int, indexTo: Int) -> [Event] {
        
    }
    
    func updateTrackingCollection(trackingCollection: [Tracking]) {
        self.trackingCollection = trackingCollection
    }
    
    func setUserID(userID: UUID) {
        
    }
    
    func getEvent(eventID: UUID) -> Event {
        let flatEventCollection : [Event] = trackingCollection.flatMap({$0.eventCollection})
        let event = flatEventCollection.first(where: {$0.eventId == eventID})
        return event!
    }
    
    func deleteEvent(eventID: UUID) {
        for tracking in trackingCollection {
            tracking.removeEvent(eventId: eventID)
        }
    }
    
    func deleteTracking(trackingID: UUID) {
        trackingCollection.removeAll(where: {$0.trackingId == trackingID})
    }
    
    func updateEvent(event: Event) {
        for tracking in trackingCollection {
            if tracking.eventCollection.contains(where: {$0.eventId == event.eventId}){
              try! tracking.editEvent(eventId: event.eventId, scale: event.scale, rating: event.rating, comment: event.comment)
            }
        }
    }
    
    func updateTracking(tracking: Tracking) {
        for tracking in trackingCollection{
            if tracking.trackingId == tracking.trackingId{
                tracking.editTracking(scale: tracking.scale, rating: tracking.rating, comment: tracking.comment, trackingName: tracking.trackingName, scaleName: tracking.scaleName, color: tracking.color)
            }
        }
    }
    
    func createEvent(trackingID: UUID, newEvent: Event) {
        for tracking in trackingCollection{
            if tracking.trackingId == tracking.trackingId{
                tracking.addEvent(event: newEvent)
            }
        }
    }
    
    func getEventCollection(trackingID: UUID) -> [Event] {
        let tracking = trackingCollection.first(where: {$0.trackingId == trackingID})
        let eventCollection = tracking?.eventCollection
        return eventCollection!
    }
    
    
}
