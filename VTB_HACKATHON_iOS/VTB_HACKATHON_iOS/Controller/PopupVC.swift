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
    
    var imageToProcess: UIImage?
    var model: String?
    var prob: Double?
    
    var make: String?
    var make_model: String?
    var minPrice: Int?
    var maxPrice: Int?
    var imageURL: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        setDetails()
    }
    
    func setDetails() {
        carTitle.text = make! + make_model!
        carImage.downloaded(from: imageURL!)
        carDetails.text = "Продается от \(minPrice!) до \(maxPrice!) рублей"
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func toCreditBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: Identifier.toCreditDetailsVC, sender: nil)
    }
    @IBAction func toOtherBtnTapped(_ sender: Any) {
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
