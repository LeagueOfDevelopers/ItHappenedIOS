//
//  addTracking.swift
//  ItHappened
//
//  Created by Victor on 08/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class addTracking: UIViewController {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var ratingSC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.addTarget(self, action: #selector(goToMainScreen(_:)), for: .touchUpInside)
        createButton.layer.cornerRadius = createButton.frame.height/2
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goToMainScreen(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }



}
