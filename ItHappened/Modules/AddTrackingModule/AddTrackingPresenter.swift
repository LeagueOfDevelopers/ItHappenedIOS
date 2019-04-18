//
//  AddTrackingPresenter.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation

class AddTrackingPresenter: AddTrackingPresenterProtocol{

    var name: String = ""
    var comment: Int = 3
    var rating: Int = 3
    var scale: Int = 3
    var scaleName: String = ""
    var color: String = ""
    private var numberOfItemsSections = 5
    var view: AddTrackingViewProtocol?
    var wireframe: AddTrackingWireframeProtocol?
    var interactor: AddTrackingInteractorProtocol?
    let numbersChecking = [0,1,2]
    
    func getUserData(data: Any, for property: String) {
        switch property {
        case "name":
            self.name = data as! String
        case "scale":
            self.scale = data as! Int
        case "scaleName":
            self.scaleName = data as! String
        case "rating":
            self.rating = data as! Int
        case "comment":
            self.comment = data as! Int
        case "color":
            self.color = data as! String
        default:
            print("")
        }
    }
    
    func getEnum(value: Int) -> TrackingCustomization{
        switch value {
        case 0:
            return TrackingCustomization.Required
        case 1:
            return TrackingCustomization.Optional
        case 2:
            return TrackingCustomization.None
        default:
            return TrackingCustomization.None
        }
    }

    
    func goToNextPage(index: Int) {
        if index == 1 && self.name.isEmpty{
            view?.showErrorButton()
            return
        }
        if index == 2 && !self.numbersChecking.contains(self.comment){
            view?.showErrorButton()
            return
        }
        if index == 3 && !self.numbersChecking.contains(self.rating){
            view?.showErrorButton()
            return
        }
        if index == 4 && !self.numbersChecking.contains(self.scale){
            view?.showErrorButton()
            return
        }
        if index == 4 && ((self.scale == 0 && self.scaleName.isEmpty) || (self.scale == 1 && self.scaleName.isEmpty)) {
            view?.showErrorButton()
            return
        }
        if index == 5 && self.color.isEmpty{
            view?.showErrorButton()
            return
        }
        if index < numberOfItemsSections{
            view!.goToPage(index: index)
        }
        if index > 0{
            view?.togglePreviousButton(toggle: false)
        }
        else{
            view?.togglePreviousButton(toggle: true)
        }
        if index == numberOfItemsSections - 1{
            view?.changeNextButton(doneLabel: false, otherViews: true)
        }
        if index > 4{
            let tracking = Tracking(scaleName: self.scaleName, trackingName: self.name, id: 0, scale: getEnum(value: self.scale), rating: getEnum(value: self.rating), comment: getEnum(value: self.comment), eventCollection: [], dateOfChange: Date().convertToLocalTime(), isDeleted: false, color: self.color)
            interactor?.writeInDatabase(tracking: tracking)
            view?.dismiss()
        }
    }
    
    func goToPreviousPage(index: Int) {
        if index >= 0{
            view?.goToPage(index: index)
        }
        if index > 0{
            view?.togglePreviousButton(toggle: false)
        }
        else{
            view?.togglePreviousButton(toggle: true)
        }
        if index == numberOfItemsSections - 2{
            view?.changeNextButton(doneLabel: true, otherViews: false)
        }
    }
    
    
    
}
