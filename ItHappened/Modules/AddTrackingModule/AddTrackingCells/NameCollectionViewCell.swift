import UIKit

class NameCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nameTextField: UITextField!
    
    weak var delegate: cellNameDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.getName(name: nameTextField.text!)
        customizeFields()
    }
    
    func customizeFields(){
        let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        nameTextField.layer.cornerRadius = 4
        nameTextField.layer.borderColor = mint.cgColor
        nameTextField.layer.borderWidth = 1
    }
}
protocol cellNameDelegate: class {
    func getName(name: String)
}
