//
//  VCExtension.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import UIKit

extension UIViewController {
    
    // Show spinner of color
    func showSpinner(onView : UIView, color: UIColor, alpha: CGFloat) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = color
        spinnerView.alpha = alpha
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        UIApplication.shared.beginIgnoringInteractionEvents()
        return spinnerView
    }
    
    // Remove specific spinner
    func removeSpinner(vSpinner: UIView!) {
        UIApplication.shared.endIgnoringInteractionEvents()
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
        }
    }
}
