//
//  PopupVC+UI.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

extension PopupVC {
    func setupUI() {
        self.carImage.roundCorners(UIRectCorner.allCorners, radius: 24)
        toCreditBtn.backgroundColor = UIColor.button
        toOtherBtn.tintColor = UIColor.button
        carTitle.font = UIFont.title
        carDetails.font = UIFont.subtitle
        carDetails.textColor = UIColor.systemGray
        self.carImage.image = #imageLiteral(resourceName: "Default Car")
    }
}
