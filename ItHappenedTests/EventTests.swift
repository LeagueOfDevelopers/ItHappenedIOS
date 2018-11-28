//
//  EventTests.swift
//  ItHappenedTests
//
//  Created by Victor on 26/11/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import XCTest
@testable import ItHappened

class EventTests: XCTestCase {
    func testAddEventWithComment_CompareWithPreparedComment(){
        let rating = try? Rating(ratingValue: 5)
        let event = Event(eventId: UUID.init(), trackingId: UUID.init(), date: Date(), scale: 5.4, rating: rating!, comment: "Hello hello")
        let currentComment : String = "Hello hello"
        
        XCTAssertEqual(event.comment, currentComment)
    }
    func testAddWrongRating_GetError(){
        let rating = try? Rating(ratingValue: 1)
        XCTAssertThrowsError(try rating?.setRating(rating: 11))
    }
    func testSetNewValueToEvent_GetNewValue(){
        let rating = try? Rating(ratingValue: 5)
        let event = Event(eventId: UUID.init(), trackingId: UUID.init(), date: Date(), scale: 5.4, rating: rating!, comment: "Hello hello")
        event.setComment(comment: "Anime guys")
        let currentComment = "Anime guys"
        
        XCTAssertEqual(event.getComment(), currentComment)
    }

}
