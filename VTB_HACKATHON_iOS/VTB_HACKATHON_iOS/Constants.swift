//
//  Constants.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

// MARK: - App color scheme
extension UIColor {
    static var primary: UIColor {
        return UIColor.label
    }
    static var secondary: UIColor {
        return UIColor.secondaryLabel
    }
    static var tertiary: UIColor {
        return UIColor.systemFill
    }
    static var button: UIColor {
        return .systemPink
    }
}

// MARK: - App typography
extension UIFont {
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
    }
    static var subtitle: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
    }
    static var body: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
}

// MARK: - Connection Status
enum Connection: String {
    case wifi = "wifi"
    case cellular = "cellular"
    case unavailable = "unavailable"
    case none = "none"
}

// MARK: - Errors
enum Error: String {
    case unknow = "unknown"
}
