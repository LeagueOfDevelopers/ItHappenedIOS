import UIKit

extension UIButton{
    func showErrorButton() {
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = UIColor(displayP3Red: 255.0/255, green: 221.0/255, blue: 100.0/255, alpha: 1)
        }
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = UIColor(displayP3Red: 40.0/255, green: 192.0/255, blue: 190.0/255, alpha: 1)
        }
    }
}
