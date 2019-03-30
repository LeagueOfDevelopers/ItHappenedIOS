//
//  AddTrackingPresenter.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation

class AddTrackingPresenter {

    // MARK: Properties

    weak var view: AddTrackingView?
    var router: AddTrackingWireframe?
    var interactor: AddTrackingUseCase?
}

extension AddTrackingPresenter: AddTrackingPresentation {
    // TODO: implement presentation methods
}

extension AddTrackingPresenter: AddTrackingInteractorOutput {
    // TODO: implement interactor output methods
}
