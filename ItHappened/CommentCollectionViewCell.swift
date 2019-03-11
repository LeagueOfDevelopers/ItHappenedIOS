//
//  CommentCollectionViewCell.swift
//  ItHappened
//
//  Created by Victor on 10/03/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backButton: UIButton!
    
    weak var delegate: YourCellDelegate?
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        segmentedControl.layer.cornerRadius = segmentedControl.frame.height / 2
        backButton.addTarget(self, action: #selector(dismissVC(_:)), for: .touchUpInside)
    }
    @objc func dismissVC(_ sender: UIButton){
        delegate!.didCompleteOnboarding()
    }
}

protocol YourCellDelegate: class {
    func didCompleteOnboarding()
}
