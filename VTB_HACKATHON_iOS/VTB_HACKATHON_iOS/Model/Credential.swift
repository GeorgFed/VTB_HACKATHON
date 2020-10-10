//
//  Credential.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit

class Credential {
    public var type: CredentialType!
    public var name: String!
    public var inputImage: UIImage!
    
    init(type: CredentialType, name: String, inputImage: UIImage) {
        self.type = type
        self.name = name
        self.inputImage = inputImage
    }
}
