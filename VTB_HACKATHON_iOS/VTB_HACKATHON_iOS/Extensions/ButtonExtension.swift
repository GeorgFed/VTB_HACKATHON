//
//  UIButtonBorderExt.swift
//  tableView Test for iPresent
//
//  Created by Georg on 29.10.2018.
//  Copyright © 2018 Georg. All rights reserved.
//

import UIKit

/// # Button appearence customization
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

extension UIButton {
    func addShadow(color: UIColor? = nil, offset: CGSize? = nil, opacity: Float? = nil, radius: CGFloat? = nil) {
        self.layer.shadowColor = color?.cgColor ?? UIColor.black.cgColor
        self.layer.shadowOffset = offset ?? .zero
        self.layer.opacity = opacity ?? 0.15
        self.layer.shadowRadius = radius ?? 6
        self.layer.masksToBounds = false
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
