//
//  TrackingServiceInFactInteractor.swift
//  ItHappened
//
//  Created by Victor on 07/12/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation

class TrackingService{
    //MARK: Initialization
    private let trackingCollection : TrackingDataSource
    
    init(TrackingDataSource : TrackingDataSource){
        self.trackingCollection = TrackingDataSource
    }
    //MARK: Functions
    func AddTracking(tracking : Tracking){
        trackingCollection.createTracking(tracking: tracking)
    }
    
    func EditTracking(trackingID : UUID , scale : TrackingCustomization?, rating: TrackingCustomization?, comment : TrackingCustomization?, trackingName: String?, scaleName: String?, color : String?){
        let tracking = try! trackingCollection.getTracking(trackingID: trackingID)
        tracking.editTracking(scale: scale, rating: rating, comment: comment, trackingName: trackingName, scaleName: scaleName, color: color)
        trackingCollection.updateTracking(newTracking: tracking)
    }
    
    func AddEvent(trackingID: UUID, event : Event){
        trackingCollection.createEvent(trackingID: trackingID, newEvent: event)
    }
    
    func EditEvent(eventID : UUID, newScale : Double, newRating : Rating, newComment : String, newDate : Date){
        let event : Event = trackingCollection.getEvent(eventID: eventID)!
        event.editScale(scale: newScale)
        event.editValueOfRating(rating: newRating)
        event.editComment(comment: newComment)
        event.editDate(eventDate: newDate)
        trackingCollection.updateEvent(event: event)
    }
    
    func GetEventCollection(trackingID : UUID) -> [Event] {
        return trackingCollection.getEventCollection(trackingID: trackingID)
    }
    
    func RemoveEvent(eventID : UUID){
        trackingCollection.deleteEvent(eventID: eventID)
    }
    
    func RemoveTracking(trackingID : UUID){
        trackingCollection.deleteTracking(trackingID: trackingID)
    }
    
    func GetTracking(trackingID : UUID) -> Tracking{
        return try! trackingCollection.getTracking(trackingID: trackingID)
    }
    
    func GetTrackingCollection() -> [Tracking]{
        return trackingCollection.getTrackingCollection()
    }
}
