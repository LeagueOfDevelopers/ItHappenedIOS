import UIKit

protocol CellDelegate: class {
    func didCompleteOnboarding()
    func goToStep(step: Int)
}

