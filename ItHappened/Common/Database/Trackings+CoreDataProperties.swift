//
//  Trackings+CoreDataProperties.swift
//  ItHappened
//
//  Created by Victor on 18/04/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//
//

import Foundation
import CoreData


extension Trackings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trackings> {
        return NSFetchRequest<Trackings>(entityName: "Trackings")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var scaleName: String?
    @NSManaged public var scale: String?
    @NSManaged public var rating: String?
    @NSManaged public var comment: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var wasDeleted: Bool
    @NSManaged public var color: String?
    @NSManaged public var event: NSSet?

}

// MARK: Generated accessors for event
extension Trackings {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: Events)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: Events)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}
