import UIKit

class RatingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func getValue(_ sender: Any) {
        delegate?.getValueFromRating(segmentedControl.selectedSegmentIndex)
    }
    
    var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

