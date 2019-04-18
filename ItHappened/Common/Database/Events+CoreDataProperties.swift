//
//  Events+CoreDataProperties.swift
//  ItHappened
//
//  Created by Victor on 18/04/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: NSDate?
    @NSManaged public var scale: Int16
    @NSManaged public var rating: Int16
    @NSManaged public var comment: String?
    @NSManaged public var wasDeleted: Bool
    @NSManaged public var tracking: Trackings?

}
