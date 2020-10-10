//
//  ButtonCell.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class ButtonCell: UITableViewCell {
    @IBOutlet weak var requestBtn: UIButton!
    
    func setupUI() {
        requestBtn.backgroundColor = .button
        requestBtn.tintColor = .white
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
