//
//  RatingTests.swift
//  ItHappenedTests
//
//  Created by Victor on 29/11/2018.
//  Copyright 2018 com.example.LoD. All rights reserved.
//

import XCTest
@testable import ItHappened

class RatingTests: XCTestCase {
    
    let idForEventInFunction = UUID.init()
    let idOfEvent1 = UUID.init()
    let rating1 = try? Rating(ratingValue: 4)
    let rating2 = try? Rating(ratingValue: 6)
    
    func testCreatingTracking_GetSomeEventFromTracking(){
        let tracking = getTracking()
        try? tracking.editEvent(eventId: idOfEvent1, scale: 3.5, rating: rating2, comment: "KEKE")
        
        let currentComment : String = "KEKE"
        let event : Event = try! tracking.getEvent(eventId: idOfEvent1)
        let excpectedComment : String = event.comment
        
        XCTAssertEqual(currentComment, excpectedComment)
    }
    
    func testCreatingTracking_EditSomePropertiesInTracking(){
        let tracking = getTracking()
        tracking.scaleName = "New scale name"
        
        let excpectedScaleName : String = "New scale name"
        let currentScaleName : String = tracking.scaleName
        
        XCTAssertEqual(excpectedScaleName, currentScaleName)
    }
    
    func testAddNewEvent_GetSomePropertiesFromNewEvent(){
        let tracking = getTracking()
        let event = getEvent()
        tracking.addEvent(event: event)
        let addedEvent : Event = try! tracking.getEvent(eventId: idForEventInFunction)
        
        let currentScale : Double = addedEvent.scale
        let excpectedScale : Double = 4.3
        
        XCTAssertEqual(currentScale, excpectedScale)
        
    }
    
    func getTracking() -> Tracking{
        
        let event1 = Event(eventId: idOfEvent1, trackingId: UUID.init(), date: Date.init(), scale: 2.5, rating: rating1! , comment: "Hello, hello")
        let event2 = Event(eventId: UUID.init(), trackingId: UUID.init(), date: Date.init(), scale: 5.9, rating: rating2! , comment: "Hello, hello")
        let listOfEvent : [Event] = [event1, event2]
        let tracking = Tracking(scaleName: "Scale", trackingName: "JUST NEED TO SMOKK", trackingId: UUID.init(), trackingDate: Date.init(), scale: Tracking.TrackingCustomization.Required, rating: Tracking.TrackingCustomization.Required, comment: Tracking.TrackingCustomization.Required, eventCollection: listOfEvent, dateOfChange: DateFormatter.init(), isDeleted: false, color: "ffffff")
        return tracking
    }
    
    func getEvent() -> Event{
        let event = Event(eventId: idForEventInFunction, trackingId: UUID.init(), date: Date.init(), scale: 4.3, rating: rating1!, comment: "Some event")
        return event
    }
    
}
