//
//  AddTrackingWireframe.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class AddTrackingWireframe: AddTrackingWireframeProtocol {
    class func createAddTrackingModule(addTrackingRef: AddTrackingViewController) {
        let presenter: AddTrackingPresenterProtocol = AddTrackingPresenter()
        addTrackingRef.presenter = presenter
        addTrackingRef.presenter?.view = addTrackingRef
        addTrackingRef.presenter?.interactor = AddTrackingInteractor()
    }
    
}
