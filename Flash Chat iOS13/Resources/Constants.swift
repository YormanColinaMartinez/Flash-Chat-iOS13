//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Apple on 7/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct Constants {
    static let appName = "⚡FlashChat"
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
        static let photoURL = "photoUrl"
    }
}

struct Strings {
    static let empty = ""
    static let login = "Login"
    static let register = "Register"
    static let password = "Password"
    static let email = "Email"
    static let logOut = "Log out"
    static let writeHere = "Escribe aquí"
}

struct Icons {
    static let googleIcon = "google-icon"
    static let emptyPhoto = "contact-without-photo-icon"
    static let meAvatarIcon = "me-avatar-icon"
}
