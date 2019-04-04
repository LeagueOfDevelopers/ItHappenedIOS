import UIKit

protocol AddTrackingViewProtocol: class {
    var presenter: AddTrackingPresenterProtocol?{get set}
    func changeNextButton(doneLabel: Bool, otherViews: Bool)
    func goToPage(index: Int)
    func togglePreviousButton(toggle: Bool)
    func dismiss()
}
protocol AddTrackingPresenterProtocol: class {
    var view: AddTrackingViewProtocol?{get set}
    var interactor: AddTrackingInteractorProtocol?{get set}
    var wireframe: AddTrackingWireframeProtocol?{get set}
    
    func getUserData(data: Any, for property: String)
    func goToNextPage(index: Int)
    func goToPreviousPage(index: Int)
}

protocol AddTrackingWireframeProtocol: class {
    static func createAddTrackingModule(addTrackingRef: AddTrackingViewController)
}
protocol AddTrackingInteractorProtocol: class {
    func writeInDatabase(tracking: Tracking)
}
