//
//  CreaditRequestVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class CreditRequestVC: UIViewController {
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let credentials: [[Credential]] = [[Credential(type: .name, name: "ФИО", inputImage: #imageLiteral(resourceName: "Person")),
                                   Credential(type: .birthdate, name: "Дата рождения", inputImage: #imageLiteral(resourceName: "Date")),
                                   Credential(type: .gender, name: "Пол", inputImage: #imageLiteral(resourceName: "Group of persons"))],
                                       
                                   [Credential(type: .email, name: "Email", inputImage: #imageLiteral(resourceName: "Email")),
                                   Credential(type: .phoneNumber, name: "Телефон", inputImage: #imageLiteral(resourceName: "Phone"))],
                                   
                                   [Credential(type: .passport, name: "Серия и номер", inputImage: #imageLiteral(resourceName: "Document")),
                                    Credential(type: .birthplace, name: "Место рождения", inputImage: #imageLiteral(resourceName: "Globe"))],
                                   
                                   [Credential(type: .brand, name: "Марка авто", inputImage: #imageLiteral(resourceName: "Document")),
                                    Credential(type: .carprice, name: "Цена авто", inputImage: #imageLiteral(resourceName: "Document")),
                                    Credential(type: .creditcost, name: "Сумма кредита", inputImage: #imageLiteral(resourceName: "Document")),
                                    Credential(type: .creditduration, name: "Срок кредита (месяцев)", inputImage: #imageLiteral(resourceName: "Document")),
                                    Credential(type: .creditpercent, name: "Кредитная ставка", inputImage: #imageLiteral(resourceName: "Document"))]]
    
    let sections: [String] = ["Данные", "Контакты", "Паспорт", "Кредит"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.hideKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldDidReturn() {
        
    }
}

extension CreditRequestVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == credentials.count {
            return 1
        } else {
            return credentials[section].count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return credentials.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == credentials.count {
            return tableView.dequeueReusableCell(withIdentifier: Identifier.buttonCell)!
        } else if indexPath.section == credentials.count - 1 && indexPath.row == 2 {
            return tableView.dequeueReusableCell(withIdentifier: Identifier.sliderCell)!
        } else {
            let inputCell: InputCell! = tableView.dequeueReusableCell(withIdentifier: Identifier.inputCell) as? InputCell
            inputCell.configure(credential: credentials[indexPath.section][indexPath.row])
            
            inputCell.inputField.tag = credentials[indexPath.section][indexPath.row].type!.rawValue
            inputCell.inputField.addTarget(self, action: #selector(textFieldDidReturn), for: .editingDidEnd)
            return inputCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == credentials.count {
            return ""
        } else {
            return sections[section]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        myLabel.font = UIFont.subtitle
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
