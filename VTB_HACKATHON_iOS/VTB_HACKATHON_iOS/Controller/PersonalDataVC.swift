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
    @IBOutlet weak var income: HoshiTextField!
    
    @IBOutlet weak var doneBtn: UIButton!
    let datePicker = UIDatePicker()
    let picker = UIPickerView()
    
    let genders = ["Мужской", "Женский", "Другое"]
    
    var validName = false
    var validEmail = false
    var validPhone = false
    var allFilled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validate()
        self.hideKeyboard()
        tagTextFields()
        name.delegate = self
        birthdate.delegate = self
        birthplace.delegate = self
        gender.delegate = self
        email.delegate = self
        phone.delegate = self
        income.delegate = self
        name.autocorrectionType = .no
        birthdate.autocorrectionType = .no
        gender.autocorrectionType = .no
        email.autocorrectionType = .no
        phone.autocorrectionType = .no
        income.autocorrectionType = .no
        createDatePicker()
        createPicker()
    }
    
    func tagTextFields() {
        name.tag = 0
        birthdate.tag = 1
        birthplace.tag = 2
        gender.tag = 3
        email.tag = 4
        phone.tag = 5
        income.tag = 6
    }
    
    func createPicker() {
        picker.dataSource = self
        picker.delegate = self

        gender.inputView = picker
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        birthdate.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(pickerDonePressed))
        doneButton.tintColor = .button
        toolbar.setItems([doneButton], animated: true)
        birthdate.inputAccessoryView = toolbar
    }
    
    @objc func pickerDonePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale.autoupdatingCurrent
        
        let uniFormatter = DateFormatter()
        uniFormatter.dateStyle = .medium
        uniFormatter.timeStyle = .none
        uniFormatter.dateFormat = "dd-MM-yyyy"
        uniFormatter.locale = Locale(identifier: "en_US")
        
        birthdate.text = dateFormatter.string(from: datePicker.date)
        
        birthplace.becomeFirstResponder()
        self.view.endEditing(true)
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)

            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    func isFilled() -> Bool {
        return name.text != "" && birthdate.text != "" && birthplace.text != "" && gender.text != "" && email.text != "" && phone.text != "" && income.text != ""
    }
    
    func validateEmail() -> Bool {
        let response = Validation.shared.validate(values: (ValidationType.email, email.text!))
        switch response {
        case .success:
            return true
        case .failure(_, let msg):
            print(msg.localized())
            return false
        }
    }
    
    func validatePhone() -> Bool {
        return phone.text!.count == 18
        /*
        let response = Validation.shared.validate(values: (ValidationType.phoneNo, phone.text!))
        switch response {
        case .success:
            return true
        case .failure(_, let msg):
            print(msg.localized())
            return false
        }
         */
    }
    
    func validateName() -> Bool {
        if name.text!.wordCount != 3 {
            return false
        } else {
            return true
        }
//        let response = Validation.shared.validate(values: (ValidationType.stringWithFirstLetterCaps, name.text!))
//        switch response {
//        case .success:
//            return true
//        case .failure(_, let msg):
//            print(msg.localized())
//            return false
//        }
    }
    
    func validate() {
        if validateName() && validEmail && validatePhone() && isFilled() {
            doneBtn.isEnabled = true
            doneBtn.alpha = 1.0
        } else {
            doneBtn.isEnabled = false
            doneBtn.alpha = 0.2
        }
    }
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    @IBAction func closeBtnPressde(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: - Table view data source
extension PersonalDataVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
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
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension PersonalDataVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            validName = validateName()
            textField.tintColor = validName ? .green : .red
        case 4:
            validEmail = validateEmail()
            textField.tintColor = validEmail ? .green : .red
        case 5:
            validPhone = validatePhone()
            textField.tintColor = validPhone ? .green : .red
        default:
            if textField.text != "" {
                textField.tintColor = .green
            } else {
                textField.tintColor = .red
            }
        }
        validate()
        // textFieldShouldReturn(textField)
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        // textFieldShouldReturn(textField)
//    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 5 {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = format(with: "+X (XXX) XXX-XX-XX", phone: newString)
            return false
        }
        return true
    }

    
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
        } else if textField.tag == 5 {
            income.resignFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}

extension PersonalDataVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender.text = genders[row]
        picker.resignFirstResponder()
    }
}
