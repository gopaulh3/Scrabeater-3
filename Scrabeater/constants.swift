//
//  constants.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 31/08/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import Foundation

struct K {
    static let appName = "Scrabeater  "
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
