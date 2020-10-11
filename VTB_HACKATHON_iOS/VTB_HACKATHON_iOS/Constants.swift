//
//  Constants.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

enum CredentialType: Int {
    case name = 0
    case email = 1
    case phoneNumber = 2
    case birthdate = 3
    case gender = 4
    case passport = 5
    case birthplace = 6
    case brand = 7
    case carprice = 8
    case creditcost = -1
    case creditduration = 9
    case creditpercent = 10
}

struct Identifier {
    public static let buttonCell = "buttonCell"
    public static let sliderCell = "sliderCell"
    
    public static let toPopupVC = "toPopupVC"
    public static let toCreditDetailsVC = "toCreditDetailsVC"
    public static let toPersonalDataVC = "toPersonalDataVC"
}

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
        return #colorLiteral(red: 0.2274509804, green: 0.5137254902, blue: 0.9450980392, alpha: 1)
    }
}

// MARK: - App typography
extension UIFont {
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
    }
    static var subtitle: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
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
