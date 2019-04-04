import Foundation

class AddTrackingInteractor: AddTrackingInteractorProtocol {
    func writeInDatabase(tracking: Tracking) {
        let database = Database()
        database.createTable()
        database.deleteAllRows()
        database.insert(tracking: tracking)
    }
}
