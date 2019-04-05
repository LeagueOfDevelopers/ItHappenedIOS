import UIKit

class ScaleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var scaleTextField: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func getValue(_ sender: Any) {
        if segmentedControl.selectedSegmentIndex == 2{
            scaleTextField.isEnabled = false
            scaleTextField.text?.removeAll()
            scaleTextField.layer.borderColor = UIColor.gray.cgColor
            delegate?.getValueFromScale(segmentedControl.selectedSegmentIndex, scaleName: "")
        }
        else {
            scaleTextField.isEnabled = true
            changeColorToMint()
            delegate?.getValueFromScale(segmentedControl.selectedSegmentIndex, scaleName: scaleTextField.text!)
        }
    }

    
    weak var delegate: indexFromSControlDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        scaleTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        delegate?.getValueFromScale(segmentedControl.selectedSegmentIndex, scaleName: scaleTextField.text!)
    }
    
    func changeColorToMint(){
        let mint = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        scaleTextField.layer.cornerRadius = 4
        scaleTextField.layer.borderColor = mint.cgColor
        scaleTextField.layer.borderWidth = 1
    }
}
