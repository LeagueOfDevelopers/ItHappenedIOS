//
//  RatingCollectionViewCell.swift
//  ItHappened
//
//  Created by Victor on 13/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class RatingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var dismissButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    weak var delegate: CellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dismissButton.addTarget(self, action: #selector(dismissVC(_:)), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backToPreviousVC(_:)), for: .touchUpInside)
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
    }
    @objc func dismissVC(_ sender: UIButton){
        delegate!.didCompleteOnboarding()
    }
    @objc func backToPreviousVC(_ sender: UIButton){
        delegate!.goToStep(step: 0)
    }
}

