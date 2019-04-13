//
//  AddEventViewController.swift
//  ItHappened
//
//  Created by Victor on 12/04/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit
import Cosmos

class AddEventViewController: UIViewController {
    @IBOutlet var commentTextField: UITextView!
    @IBOutlet var starRating: CosmosView!
    @IBOutlet var scaleTextField: UITextField!
    @IBOutlet var doneButton: UIButton!
    let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
    var tracking: Tracking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMintBorders(view: commentTextField)
        getMintBorders(view: scaleTextField)
        getRoundBorders()
        print(tracking!.color)
    }
    func getMintBorders(view: AnyObject){
        view.layer.cornerRadius = 4
        view.layer.borderColor = mint.cgColor
        view.layer.borderWidth = 1
    }
    func getRoundBorders(){
        doneButton.backgroundColor = mint
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
    }
}
