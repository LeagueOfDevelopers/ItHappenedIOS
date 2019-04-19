import Foundation
class AddEventPresenter: AddEventPresenterProtocol {
    var view: AddEventViewProtocol?
    
    var interactor: AddEventInteractorProtocol?
    
    var wireframe: AddEventWireframeProtocol?
    
    func checkDataForEvent(comment: String, rating: Int, scale: Int, date: Date, tracking: Trackings) {
        if tracking.comment == "Required" && comment.isEmpty{
            view?.showErrorButton()
            return
        }
        if tracking.rating == "Required" && rating == 0{
            view?.showErrorButton()
            return
        }
        if tracking.scale == "Required" && scale == 0{
            view?.showErrorButton()
            return
        }
        interactor?.createEvent(comment: comment, rating: rating, scale: scale, date: date, tracking: tracking)
    }

    
    
}
