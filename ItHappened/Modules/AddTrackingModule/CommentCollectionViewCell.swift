import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    @IBOutlet var dismissButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var descriptionOfTracking: UITextView!
    weak var delegate: CellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dismissButton.addTarget(self, action: #selector(dismissVC(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextStep(_:)), for: .touchUpInside)
        nextButton.layer.cornerRadius = nextButton.frame.height / 2
        descriptionOfTracking.layer.borderWidth = 1
        let green = UIColor(red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        descriptionOfTracking.layer.borderColor = green.cgColor
    }
    @objc func dismissVC(_ sender: UIButton){
        delegate!.didCompleteOnboarding()
    }
    @objc func nextStep(_ sender: UIButton){
        if descriptionOfTracking.text == "" {
            
        }
        else{
            delegate!.goToStep(step: 1)
        }
        
    }
}
