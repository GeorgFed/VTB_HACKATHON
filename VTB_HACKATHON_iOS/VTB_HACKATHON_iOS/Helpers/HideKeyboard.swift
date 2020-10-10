
import UIKit

/// # HIDE KEYBOARD ON TAP
/// NOTE: Might cause problems with scroll views

extension UIViewController {
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
}
