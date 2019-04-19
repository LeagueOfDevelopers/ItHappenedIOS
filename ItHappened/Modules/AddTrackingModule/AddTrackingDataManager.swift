import Foundation
class AddTrackingDataManager: AddTrackingDataManagerProtocol{
    func writeInDataBase(tracking: Tracking) {
        let trackings = Trackings(context: CoreDataManager.instance.persistentContainer.viewContext)
        trackings.id = UUID()
        trackings.name = tracking.trackingName
        trackings.date = Date() as NSDate
        trackings.comment = tracking.comment.rawValue
        trackings.scale = tracking.scale.rawValue
        trackings.scaleName = tracking.scaleName
        trackings.rating = tracking.rating.rawValue
        trackings.wasDeleted = false
        trackings.color = tracking.color
        CoreDataManager.instance.saveContext()
    }
}
