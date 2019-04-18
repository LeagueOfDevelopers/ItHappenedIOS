import Foundation
class AddTrackingDataManager: AddTrackingDataManagerProtocol{
    func writeInDataBase(tracking: Tracking) {
        let database = Database()
        database.createTrackingTable()
        database.insertTracking(tracking: tracking)
    }
}
