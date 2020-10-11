//
//  CreditDetailsVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import UIKit

class CreditDetailsVC: UITableViewController {

    @IBOutlet weak var brand: HoshiTextField!
    @IBOutlet weak var price: HoshiTextField!
    @IBOutlet weak var creditsum: UITextField!
    @IBOutlet weak var duration: HoshiTextField!
    @IBOutlet weak var interestRate: HoshiTextField!
    
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        brand.delegate = self
        price.delegate = self
        creditsum.delegate = self
        duration.delegate = self
        interestRate.delegate = self
        brand.autocorrectionType = .no
        price.autocorrectionType = .no
        creditsum.autocorrectionType = .no
        duration.autocorrectionType = .no
        interestRate.autocorrectionType = .no
        tagTextFields()
    }

    func tagTextFields() {
        brand.tag = 0
        price.tag = 1
        creditsum.tag = 2
        duration.tag = 3
        interestRate.tag = 4
    }
    
    @IBAction func sliderHasChanged(_ sender: UISlider) {
        creditsum.text = "\(Int(sender.value))"
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

    // MARK: - Table view data source
extension CreditDetailsVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 2
        default:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        myLabel.font = UIFont.subtitle
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension CreditDetailsVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 2 && textField.text != "" {
            slider.setValue(Float(textField.text!)!, animated: true)
        }
        textFieldShouldReturn(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
           price.becomeFirstResponder()
        } else if textField.tag == 1 {
           creditsum.becomeFirstResponder()
        } else if textField.tag == 2 {
            duration.becomeFirstResponder()
        } else if textField.tag == 3 {
            interestRate.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
      }
}
