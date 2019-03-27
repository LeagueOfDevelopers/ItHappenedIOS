//
//  ScaleCollectionViewCell.swift
//  ItHappened
//
//  Created by Victor on 23/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class ScaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var scaleTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    weak var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        scaleTextField.layer.cornerRadius = 4
        scaleTextField.layer.borderColor = mint.cgColor
        scaleTextField.layer.borderWidth = 1
    }
}
