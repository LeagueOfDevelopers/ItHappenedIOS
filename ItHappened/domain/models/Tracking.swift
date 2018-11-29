//
//  Tracking.swift
//  ItHappened
//
//  Created by Victor on 29/11/2018.
//  Copyright 2018 com.example.LoD. All rights reserved.
//

import Foundation

class Tracking{
    var scaleName: String
    var trackingName : String
    let trackingId : UUID
    var trackingDate :  Date
    var scale : TrackingCustomization
    var rating : TrackingCustomization
    var comment : TrackingCustomization
    var eventCollection : [Event]
    var dateOfChange : DateFormatter
    var isDeleted : Bool
    var color : String
    
    init (scaleName: String, trackingName : String, trackingId : UUID, trackingDate :  Date, scale : TrackingCustomization, rating : TrackingCustomization, comment : TrackingCustomization, eventCollection : [Event], dateOfChange : DateFormatter, isDeleted : Bool, color : String){
        self.scaleName = scaleName
        self.trackingName = trackingName
        self.trackingId = trackingId
        self.trackingDate = trackingDate
        self.scale = scale
        self.rating = rating
        self.comment = comment
        self.eventCollection = eventCollection
        self.dateOfChange = dateOfChange
        self.isDeleted = isDeleted
        self.color = color
    }
    //MARK: Enumerators
    enum  TrackingCustomization {
        case None
        case Required
        case Optional
    }
    enum error : Error{
        case IllegalArgumentException(String)
    }
    //MARK: Functions
    func getCurrentDate() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd H:mm:ssZZZ"
        return dateFormatter
    }
    func addEvent(event : Event){
        try! customizationCheck(value: event.scale, trackingCustomiztion: scale)
        try! customizationCheck(value: event.rating, trackingCustomiztion: rating)
        try! customizationCheck(value: event.comment, trackingCustomiztion: comment)
        eventCollection.append(event)
        dateOfChange = getCurrentDate()
    }
    func editTracking(scale : TrackingCustomization?, rating: TrackingCustomization?, comment : TrackingCustomization?, trackingName: String?, scaleName: String?, color : String?){
        self.scale = scale ?? self.scale
        self.rating = rating ?? self.rating
        self.comment = comment ?? self.comment
        self.trackingName = trackingName ?? self.trackingName
        self.scaleName = scaleName ?? self.scaleName
        self.color = color ?? self.color
    }
    func removeEvent(eventId : UUID){
        eventCollection.removeAll(where:{$0.eventId == eventId})
    }
    func editEvent(eventId:UUID, scale : Double?, rating : Rating?, comment : String?) throws{
        let event = eventCollection.first(where: {$0.eventId == eventId})
        if event != nil{
            event!.scale = scale ?? event!.scale
            event!.rating = rating ?? event!.rating
            event!.comment = comment ?? event!.comment
        }
        else {
            throw error.IllegalArgumentException("Event don't exist")
        }
    }
    func customizationCheck(value : Any?, trackingCustomiztion : TrackingCustomization) throws{
        if value == nil && trackingCustomiztion == TrackingCustomization.Required{
            throw error.IllegalArgumentException("Non-optional parameters can not be empty")
        }
        if value != nil && trackingCustomiztion == TrackingCustomization.None{
            throw error.IllegalArgumentException("None customizations can not take a value")
        }
    }
    func getEvent(eventId : UUID) throws -> Event {
        let event = eventCollection.first(where: {$0.eventId == eventId})
        if event == nil{
            throw error.IllegalArgumentException("Event don't exist")
        }
        return event!
    }
    func deleteTracking(){
        self.isDeleted = true
        self.dateOfChange = getCurrentDate()
        for event in eventCollection{
            event.isDeleted = true
        }
    }
    //    func getEventHistory() -> [Event]{
    //
    //    }
    
}
