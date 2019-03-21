import UIKit

class NameCollectionViewCell: UICollectionViewCell {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    
    weak var delegate: cellNameDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.getNameAndDescription(name: nameTextField.text!, description: descriptionTextView.text)
        customizeFields()
    }
    
    func customizeFields(){
        let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        nameTextField.layer.cornerRadius = 4
        nameTextField.layer.borderColor = mint.cgColor
        nameTextField.layer.borderWidth = 1
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = mint.cgColor
        descriptionTextView.layer.cornerRadius = 4
    }
}
protocol cellNameDelegate: class {
    func getNameAndDescription(name: String, description: String)
}
