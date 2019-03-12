import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    weak var delegate: YourCellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backButton.addTarget(self, action: #selector(dismissVC(_:)), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(nextStep(_:)), for: .touchUpInside)
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
    }
    @objc func dismissVC(_ sender: UIButton){
        delegate!.didCompleteOnboarding()
    }
    @objc func nextStep(_ sender: UIButton){
        delegate!.goToNextStep(step: 1)
    }
}

protocol YourCellDelegate: class {
    func didCompleteOnboarding()
    func goToNextStep(step: Int)
}
