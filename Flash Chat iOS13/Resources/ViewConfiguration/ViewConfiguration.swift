//
//  ViewConfiguration.swift
//  Flash Chat iOS13
//
//  Created by Apple on 25/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct ConfigurationAppView {
    static func inputButtonCofiguration(
        with button: UIButton,
        textColor: UIColor?,
        backgroundColor: UIColor?,
        isCircularButton: Bool
    ) {
        if !isCircularButton {
            button.backgroundColor = backgroundColor
            button.titleLabel?.font = .boldSystemFont(ofSize: 22)
            button.setTitleColor(textColor, for: .normal)
        } else {
            button.setTitle(Strings.empty, for: .normal)
        }
        button.layer.cornerRadius = button.frame.size.height / 2
        button.layer.shadowOffset = CGSize(width: -3, height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
    }
    
    static func inputTextFieldViewConfiguration(with view: UIView) {
        view.layer.cornerRadius = view.frame.size.height / 2
        view.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
    }
    
    static func setButtonAttributted(_ button: UIButton, title: String, size: Double) {
        let title: NSAttributedString = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.systemFont(ofSize: size, weight: .bold),
                .foregroundColor: UIColor.white
            ]
        )
        button.setAttributedTitle(title, for: .normal)
    }
}
