//
//  AddTrackingPresenter.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation

class AddTrackingPresenter: AddTrackingPresenterProtocol{

    var name: String = "Your name"
    var comment: Int = 0
    var rating: Int = 0
    var scale: Int = 0
    var scaleName: String = "ScaleName"
    var color: String = "#000000"
    
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
            return TrackingCustomization.None
        case 1:
            return TrackingCustomization.Optional
        case 2:
            return TrackingCustomization.Required
        default:
            return TrackingCustomization.None
        }
    }
    
    private var numberOfItemsSections = 5
    var view: AddTrackingViewProtocol?
    var wireframe: AddTrackingWireframeProtocol?
    var interactor: AddTrackingInteractorProtocol?

    
    func goToNextPage(index: Int) {
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
            let tracking = Tracking(scaleName: self.scaleName, trackingName: self.name, id: 0, scale: getEnum(value: self.scale), rating: getEnum(value: self.rating), comment: getEnum(value: self.comment), eventCollection: [], dateOfChange: Date(), isDeleted: false, color: self.color)
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
