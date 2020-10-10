//
//  PopupVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class PopupVC: UIViewController {
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var carTitle: UILabel!
    @IBOutlet weak var carDetails: UILabel!
    @IBOutlet weak var toCreditBtn: UIButton!
    @IBOutlet weak var toOtherBtn: UIButton!
    @IBOutlet weak var carImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toCreditBtnTapped(_ sender: Any) {
    }
    @IBAction func toOtherBtnTapped(_ sender: Any) {
    }
    
}
