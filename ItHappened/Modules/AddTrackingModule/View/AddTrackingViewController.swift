//
//  AddTrackingViewController.swift
//  ItHappened
//
//  Created by Victor on 30/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import Foundation
import UIKit

class AddTrackingViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties

    var presenter: AddTrackingPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddTrackingViewController: AddTrackingView {
    // TODO: implement view output methods
}
