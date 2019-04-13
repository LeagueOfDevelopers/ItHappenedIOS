import Foundation

class AddTrackingInteractor: AddTrackingInteractorProtocol {
    var dataManager: AddTrackingDataManagerProtocol?
    
    func writeInDatabase(tracking: Tracking) {
        dataManager?.writeInDataBase(tracking: tracking)
    }
}
