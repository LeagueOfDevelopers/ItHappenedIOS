//
//  TrackingDataSource.swift
//  ItHappened
//
//  Created by Victor on 07/12/2018.
//  Copyright © 2018 com.example.LoD. All rights reserved.
//

import Foundation

protocol TrackingDataSourceProtocol {
    func getTracking(trackingID: UUID) throws -> Tracking
    func getTrackingCollection() -> [Tracking]
    func createTracking (tracking: Tracking)
    func updateTrackingCollection (trackingCollection : [Tracking])
    func setUserID(userID: UUID)
    func getEvent(eventID: UUID) -> Event? 
    func deleteEvent(eventID: UUID)
    func deleteTracking (trackingID : UUID)
    func updateEvent(event : Event)
    func updateTracking(newTracking : Tracking)
    func createEvent(trackingID : UUID, newEvent : Event)
    func getEventCollection (trackingID : UUID) -> [Event]
}
