import UIKit

protocol AddEventViewProtocol {
    var presenter: AddEventPresenterProtocol?{get set}
    func showErrorButton()
}

protocol AddEventPresenterProtocol {
    var view: AddEventViewProtocol?{get set}
    var interactor: AddEventInteractorProtocol?{get set}
    var wireframe: AddEventWireframeProtocol?{get set}
    
    func checkDataForEvent(comment: String, rating: Int, scale: Int, date: Date, tracking: Trackings)
}

protocol AddEventInteractorProtocol {
    var dataManager: AddEventDataManagerProtocol? {get set}
    func createEvent(comment: String, rating: Int, scale: Int, date: Date, tracking: Trackings)
}

protocol AddEventDataManagerProtocol {
    func writtenInCoreData(event: Event, tracking: Trackings)
}

protocol AddEventWireframeProtocol {
    static func createAddEventModule(addEventRef: AddEventViewController)
    func toRootViewController(navigationController: UINavigationController)
}
