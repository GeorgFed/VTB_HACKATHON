//
//  StringExtension.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import Foundation

extension String {
    var wordCount: Int {
            let regex = try? NSRegularExpression(pattern: "\\w+")
            return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
        }
}
