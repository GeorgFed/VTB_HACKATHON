//
//  InputCell.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class InputCell: UITableViewCell {

    @IBOutlet weak var inputField: HoshiTextField!
    @IBOutlet weak var inputImage: UIImageView!
    var credentialType: CredentialType!
    
    public func configure(credential: Credential) {
        self.inputField.placeholder = credential.name
        self.inputImage.image = credential.inputImage
        self.credentialType = credential.type
    }
    
    func setupUI() {
        
    }
    
    func validate() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.inputField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension InputCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(inputField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            inputField.resignFirstResponder()
        }
        return false
    }
}
