//
//  HeaderCell.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.text = "История"
        title.font = UIFont.title
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func close() {
        
    }
}
