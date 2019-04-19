import Foundation
class AddEventInteractor: AddEventInteractorProtocol {
    var dataManager: AddEventDataManagerProtocol?
    
    func createEvent(comment: String, rating: Int, scale: Int, date: Date, tracking: Trackings) {
        let event = Event(eventId: 0, trackingId: 0, date: date, scale: scale, rating: rating, comment: comment, isDeleted: false)
        dataManager?.writtenInCoreData(event: event, tracking: tracking)
    }
    
    
}
