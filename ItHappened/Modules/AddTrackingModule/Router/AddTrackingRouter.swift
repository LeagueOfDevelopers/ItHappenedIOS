//
//  AddTrackingRouter.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation
import UIKit

class AddTrackingRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> AddTrackingViewController {
        let viewController = UIStoryboard.loadViewController() as AddTrackingViewController
        let presenter = AddTrackingPresenter()
        let router = AddTrackingRouter()
        let interactor = AddTrackingInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension AddTrackingRouter: AddTrackingWireframe {
    // TODO: Implement wireframe methods
}
