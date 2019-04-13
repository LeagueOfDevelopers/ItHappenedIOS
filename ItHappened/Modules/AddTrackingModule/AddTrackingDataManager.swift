import Foundation
class AddTrackingDataManager: AddTrackingDataManagerProtocol{
    func writeInDataBase(tracking: Tracking) {
        let database = Database()
        database.createTable()
        database.insert(tracking: tracking)
    }
}
