import UIKit

extension AddTrackingViewController: cellNameDelegate{
    func getName(name: String) {
        self.name = name
    }
    func checkTextFields() -> Bool{
        if self.name!.isEmpty {
            return false
        }
        return true
    }
}

