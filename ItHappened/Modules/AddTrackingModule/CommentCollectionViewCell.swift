import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func getValue(_ sender: Any) {
        delegate?.getValueFromComment(segmentedControl.selectedSegmentIndex)
    }
    
    weak var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}


protocol indexFromSControlDelegate: class {
    func getValueFromComment(_ value: Int)
    func getValueFromRating (_ value: Int)
    func getValueFromScale(_ value: Int, scaleName: String)
}
