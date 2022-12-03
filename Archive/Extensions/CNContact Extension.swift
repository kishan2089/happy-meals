//
//  CNContact Extension.swift
//  ContactSuitV2Dev
//
//  Created by Kartum Infotech on 23/06/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation
import Contacts
//MARK: - Contact Formatting String
extension CNContact {
    
    func fullName() -> String {
        if let name = CNContactFormatter.string(from: self, style: .fullName) {
          return name
       }
      return ""
    }
    
    var phones: [String] {
       return self.phoneNumbers.map { $0.value.stringValue.replacingOccurrences(of: "[^\\d+]", with: "", options: [.regularExpression]) }
    }
    
    var emails: [String] {
       return self.emailAddresses.map { ($0.value as String) }
    }
    
}

extension CNPhoneNumber {
    var cleanedPhoneNumber: String {
        return self.stringValue.replacingOccurrences(of: "[^\\d+]", with: "", options: [.regularExpression])
    }
}
