import UIKit

class AddEventWireframe: AddEventWireframeProtocol {
    
    static func createAddEventModule(addEventRef: AddEventViewController) {
        let presenter: AddEventPresenterProtocol = AddEventPresenter()
        addEventRef.presenter = presenter
        addEventRef.presenter?.view = addEventRef
        addEventRef.presenter?.interactor = AddEventInteractor()
        addEventRef.presenter?.interactor?.dataManager = AddEventDataManager()
    }
    
    func toRootViewController(navigationController: UINavigationController) {
        navigationController.popToRootViewController(animated: true)
    }
    
}
