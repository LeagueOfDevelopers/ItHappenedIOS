//
//  AddTrackingPresenter.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation

class AddTrackingPresenter: AddTrackingPresenterProtocol{

    
    
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
            let tracking = Tracking(scaleName: "DIS IS SCATMAN",
                                    trackingName: "Henlo",
                                    id: 0,
                                    scale: .Optional,
                                    rating: .Required,
                                    comment: .None,
                                    eventCollection: [],
                                    dateOfChange: Date(timeIntervalSinceReferenceDate: 3443),
                                    isDeleted: false,
                                    color: "#2FC961")
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
