//
//  InMemoryRepositoryTests.swift
//  ItHappenedTests
//
//  Created by Victor on 07/12/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import XCTest
@testable import ItHappened

class InMemoryRepositoryTests: XCTestCase {
    func testGetTrackingName_checkTrackingName(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        let currentTracking = try! trackingCollection.getTracking(trackingID: idOfTracking1)
        let currentTrackingName = currentTracking.trackingName
        
        let excpectedTrackingName = "First tracking"
        
        XCTAssertEqual(excpectedTrackingName, currentTrackingName)
    }
    
    func testCreateNewTracking_checkAndGetLastTrackingFromCollection(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        let tracking4 = Tracking(scaleName: "Scale 5", trackingName: "Fifth tracking", trackingId: idOfTracking4, trackingDate: Date.init(), scale: TrackingCustomization.Required, rating: TrackingCustomization.Required, comment: TrackingCustomization.Required, eventCollection: [], dateOfChange: DateFormatter.init(), isDeleted: false, color: "NewColor")
        trackingCollection.createTracking(tracking: tracking4)
        let lastTracking = try! trackingCollection.getTracking(trackingID: idOfTracking4)
        let lastTrackingColor = lastTracking.color
        
        let excpectedTrackingColor = "NewColor"
        
        XCTAssertEqual(excpectedTrackingColor, lastTrackingColor)
    }
    
    func testTryGetEvent_GetNeededEvent(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        let currentEvent = trackingCollection.getEvent(eventID: idOfEvent3)
        let currentEventScale : Double = 6.1
        
        let excpectedEventScale = currentEvent!.scale
        
        XCTAssertEqual(currentEventScale, excpectedEventScale)
    }
    
    func testDeleteSomeEvent_CantGetDeletedEvent(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        trackingCollection.deleteEvent(eventID: idOfEvent4)
        let event = trackingCollection.getEvent(eventID: idOfEvent4)
        
        XCTAssertNil(event)
    }
    
    func testUpdateEvent_GetSomeNewPropertiesFromUpdatedEvent(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        let updateEvent1 = Event(eventId: idOfEvent1, trackingId: UUID.init(), date: Date.init(), scale: 2.5, rating: rating1! , comment: "Updated Event")
        trackingCollection.updateEvent(event: updateEvent1)
        let updadedEvent1 = trackingCollection.getEvent(eventID: idOfEvent1)
        let currentEvent1Comment = updadedEvent1?.comment
        
        let excpectedEvent1Comment = "Updated Event"
        
        XCTAssertEqual(excpectedEvent1Comment, currentEvent1Comment)
    }
    
    func testUpdateTracking_GetSomeNewPropertiesFromUpdatedTracking(){
        let trackingCollection = TrackingDataSource(trackingCollection: getTrackingCollection())
        let updateTracking = Tracking(scaleName: "Updated Scale Name", trackingName: "First tracking", trackingId: idOfTracking1, trackingDate: Date.init(), scale: TrackingCustomization.Required, rating: TrackingCustomization.Required, comment: TrackingCustomization.Required, eventCollection: [], dateOfChange: DateFormatter.init(), isDeleted: false, color: "ffffff")
        trackingCollection.updateTracking(newTracking: updateTracking)
        let currentTracking = try! trackingCollection.getTracking(trackingID: idOfTracking1)
        let currentTrackingScaleName = currentTracking.scaleName
        
        let excpectedScaleName = "Updated Scale Name"
        
        XCTAssertEqual(excpectedScaleName, currentTrackingScaleName)
    }
    
    
    
    //MARK: Initialization stub trackingCollection
    let idOfEvent1 = UUID.init()
    let idOfEvent2 = UUID.init()
    let idOfEvent3 = UUID.init()
    let idOfEvent4 = UUID.init()
    let idOfTracking1 = UUID.init()
    let idOfTracking2 = UUID.init()
    let idOfTracking3 = UUID.init()
    let idOfTracking4 = UUID.init()
    let rating1 = try? Rating(ratingValue: 1)
    let rating2 = try? Rating(ratingValue: 9)
    let rating3 = try? Rating(ratingValue: 4)
    let rating4 = try? Rating(ratingValue: 2)
    
    func getTrackingCollection() -> [Tracking]{
        let event1 = Event(eventId: idOfEvent1, trackingId: UUID.init(), date: Date.init(), scale: 2.5, rating: rating1! , comment: "First event")
        let event2 = Event(eventId: idOfEvent2, trackingId: UUID.init(), date: Date.init(), scale: 5.9, rating: rating2! , comment: "Second event")
        let event3 = Event(eventId: idOfEvent3, trackingId: UUID.init(), date: Date.init(), scale: 6.1, rating: rating2! , comment: "Third event")
        let event4 = Event(eventId: idOfEvent4, trackingId: UUID.init(), date: Date.init(), scale: 4.6, rating: rating2! , comment: "Fourth event")
        let listOfEvent1 : [Event] = [event1, event2]
        let listOfEvent2 : [Event] = [event3]
        let listOfEvent3 : [Event] = [event4]
        let tracking1 = Tracking(scaleName: "Scale 1", trackingName: "First tracking", trackingId: idOfTracking1, trackingDate: Date.init(), scale: TrackingCustomization.Required, rating: TrackingCustomization.Required, comment: TrackingCustomization.Required, eventCollection: listOfEvent1, dateOfChange: DateFormatter.init(), isDeleted: false, color: "ffffff")
        let tracking2 = Tracking(scaleName: "Scale 2", trackingName: "Second tracking", trackingId: idOfTracking2, trackingDate: Date.init(), scale: TrackingCustomization.Required, rating: TrackingCustomization.Required, comment: TrackingCustomization.Required, eventCollection: listOfEvent2, dateOfChange: DateFormatter.init(), isDeleted: false, color: "ffffff")
        let tracking3 = Tracking(scaleName: "Scale 3", trackingName: "Third tracking", trackingId: idOfTracking3, trackingDate: Date.init(), scale: TrackingCustomization.Required, rating: TrackingCustomization.Required, comment: TrackingCustomization.Required, eventCollection: listOfEvent3, dateOfChange: DateFormatter.init(), isDeleted: false, color: "ffffff")
        let trackingCollection : [Tracking] = [tracking1, tracking2, tracking3]
        return trackingCollection
    }

}
