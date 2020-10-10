//
//  ImageViewExtension.swift
//  tableView Test for iPresent
//
//  Created by Georg on 27/08/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import UIKit

extension UIImageView {
    // Makes image circular
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    // Adds shadow with default value
    public func addShadow() {
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 6
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    // Adds shadow with custom value
    public func addShadow(color: UIColor, opacity: Float, radius: CGFloat) {
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
    }
    
    // Color overlay
    func addOverlay(color: UIColor) {
        
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        overlay.backgroundColor = color
        overlay.tag = 1
        
        // Check if overlay already exists before adding it
        if self.viewWithTag(1) == nil {
            self.addSubview(overlay)
        }
    }
    
    
}
