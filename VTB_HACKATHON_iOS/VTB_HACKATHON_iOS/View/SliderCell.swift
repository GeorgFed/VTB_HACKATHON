//
//  SliderCell.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class SliderCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sliderHasChanged(_ sender: UISlider) {
        title.text = "Сумма кредита: \(Int( sender.value))"
    }
}
