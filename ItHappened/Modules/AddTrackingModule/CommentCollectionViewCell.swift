import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func getValue(_ sender: Any) {
        let value = self.segmentedControl.selectedSegmentIndex
        delegate?.getValue(value)
    }
    
    weak var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}


protocol indexFromSControlDelegate: class {
    func getValue(_ value: Int)
}
