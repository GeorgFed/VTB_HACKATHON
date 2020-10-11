//
//  PersonalDataVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import UIKit

class PersonalDataVC: UITableViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var name: HoshiTextField!
    @IBOutlet weak var birthdate: HoshiTextField!
    @IBOutlet weak var birthplace: HoshiTextField!
    @IBOutlet weak var gender: HoshiTextField!
    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var phone: HoshiTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        name.delegate = self
        birthdate.delegate = self
        birthplace.delegate = self
        gender.delegate = self
        email.delegate = self
        phone.delegate = self
    }
    
    func tagTextFields() {
        name.tag = 0
        birthdate.tag = 1
        birthplace.tag = 2
        gender.tag = 3
        email.tag = 4
        phone.tag = 5
    }
}


// MARK: - Table view data source
extension PersonalDataVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
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
}

extension PersonalDataVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            birthdate.becomeFirstResponder()
        } else if textField.tag == 1 {
            birthplace.becomeFirstResponder()
        } else if textField.tag == 2 {
            gender.becomeFirstResponder()
        } else if textField.tag == 3 {
            email.becomeFirstResponder()
        } else if textField.tag == 4 {
            phone.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
