//
//  EventTableViewCell.swift
//  ItHappened
//
//  Created by Victor on 19/04/2019.
//  Copyright © 2019 com.example.LoD. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet var nameOfTracking: UILabel!
    @IBOutlet var scaleEvent: UILabel!
    @IBOutlet var ratingEvent: UILabel!
    @IBOutlet var dateOfEvent: UILabel!
    @IBOutlet var colorOfTracking: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
