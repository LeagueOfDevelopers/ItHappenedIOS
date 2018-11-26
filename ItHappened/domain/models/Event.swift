//
//  Event.swift
//  ItHappened
//
//  Created by Victor on 25/11/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation
class Event{
    //MARK: Initialization
    var eventId : String
    var trackingId : String
    var eventDate : Date
    var scale : Double
    var rating : Rating
    var comment : String
    var dateOfChange : DateFormatter?
    var isDeleted : Bool?
    
    init(eventId : UUID, trackingId: UUID, date: Date, scale : Double,
         rating: Rating, comment : String, isDeleted: Bool = false){
        self.eventId = eventId.uuidString
        self.trackingId = trackingId.uuidString
        self.eventDate = date
        self.scale = scale
        self.rating = rating
        self.comment = comment
        self.dateOfChange = getCurrentDate()
        self.isDeleted = isDeleted
    }
    
    //MARK: Functions
    func getCurrentDate() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd H:mm:ssZZZ"
        return dateFormatter
    }
    func editDate(eventDate : Date){
        self.eventDate = eventDate
        self.dateOfChange = getCurrentDate()
    }
    func editScale(scale : Double){
        self.scale = scale
        self.dateOfChange = getCurrentDate()
    }
    func editValueOfRating(rating: Rating){
        self.rating = rating
        self.dateOfChange = getCurrentDate()
    }
    func editComment(comment : String){
        self.comment = comment
        self.dateOfChange = getCurrentDate()
    }
    func removeEvent(){
        self.isDeleted = true
        self.dateOfChange = getCurrentDate()
    }
    func getEventDate() -> Date {
        return self.eventDate
    }
    func setEventDate(date: Date){
        self.eventDate = date
    }
    func getEventId() -> UUID{
        let uuid = UUID(uuidString: self.eventId)
        return uuid!
    }
    func setEventId(uuid: UUID){
        self.eventId = uuid.uuidString
    }
    func getScale() -> Double{
        return self.scale
    }
    func setScale(scale : Double){
        self.scale = scale
    }
    func getRating() -> Rating{
        return self.rating
    }
    func setRating(rating : Rating){
        self.rating = rating
    }
    func getComment() -> String{
        return self.comment
    }
    func setComment(comment : String){
        self.comment = comment
    }
    func getTrackingId() -> UUID{
        let uuid = UUID(uuidString: self.trackingId)
        return uuid!
    }
    func setTrackingId(uuid : UUID){
        self.trackingId = uuid.uuidString
    }
    func returnStatus() -> Bool?{
        return self.isDeleted
    }
    func setStatus(status : Bool){
        self.isDeleted = status
    }
    
    
}
