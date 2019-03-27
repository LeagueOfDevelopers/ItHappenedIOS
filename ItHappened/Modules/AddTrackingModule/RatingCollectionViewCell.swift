import UIKit

class RatingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    weak var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

