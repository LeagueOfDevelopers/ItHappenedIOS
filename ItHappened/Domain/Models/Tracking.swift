//
//  Tracking.swift
//  ItHappened
//
//  Created by Victor on 29/11/2018.
//  Copyright 2018 com.example.LoD. All rights reserved.
//

import Foundation

class Tracking{
    var id: Int
    var trackingName : String
    var scaleName: String
    var scale : TrackingCustomization
    var rating : TrackingCustomization
    var comment : TrackingCustomization
    var eventCollection : [Event]
    var dateOfChange : Date
    var isDeleted : Bool
    var color : String
    
    init (scaleName: String, trackingName : String, id : Int, scale : TrackingCustomization, rating : TrackingCustomization, comment : TrackingCustomization, eventCollection : [Event], dateOfChange : Date, isDeleted : Bool, color : String){
        self.scaleName = scaleName
        self.trackingName = trackingName
        self.id = id
        self.scale = scale
        self.rating = rating
        self.comment = comment
        self.eventCollection = eventCollection
        self.dateOfChange = dateOfChange
        self.isDeleted = isDeleted
        self.color = color
    }
    //MARK: Enumerators
    enum error : Error{
        case IllegalArgumentException(String)
    }
    //MARK: Functions
    func getCurrentDate() -> Date{
        return self.dateOfChange
    }
    func getStringDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = dateFormatter.string(from: self.dateOfChange)
        return stringDate
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
