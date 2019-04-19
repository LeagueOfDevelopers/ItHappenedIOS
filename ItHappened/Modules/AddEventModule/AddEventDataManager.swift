import UIKit

class AddEventDataManager: AddEventDataManagerProtocol {
    func writtenInCoreData(event: Event, tracking: Trackings) {
        let events = Events(context: CoreDataManager.instance.persistentContainer.viewContext)
        events.id = UUID()
        events.date = event.dateOfChange as NSDate
        events.comment = event.comment
        events.rating = Int16(event.rating)
        events.scale = Int16(event.scale)
        events.wasDeleted = false
        tracking.addToEvent(events)
        CoreDataManager.instance.saveContext()
    }
    
}
