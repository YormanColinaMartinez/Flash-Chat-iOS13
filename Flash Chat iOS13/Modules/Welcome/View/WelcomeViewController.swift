//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Apple on 17/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - @IBOutlets -
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    //MARK: - Private Methods -
    private func configureView() {
        titleLabel.font = .systemFont(ofSize: 41, weight: .black)
        titleLabel.textColor = UIColor(named: Constants.BrandColors.blue)
        setPresentationLabel()
        view.backgroundColor = .white
        ConfigurationAppView.inputButtonCofiguration(with:
            registerButton,
            textColor: .white,
            backgroundColor: UIColor(named: Constants.BrandColors.blue),
            isCircularButton: false
        )
        ConfigurationAppView.inputButtonCofiguration(with:
            loginButton,
            textColor: .white,
            backgroundColor: UIColor(named: Constants.BrandColors.purple),
            isCircularButton: false
        )
        ConfigurationAppView.setButtonAttributted(loginButton, title: Strings.login, size: 21)
        ConfigurationAppView.setButtonAttributted(registerButton, title: Strings.register, size: 21)
    }
    
    private func setPresentationLabel() {
        titleLabel.text = Strings.empty
        var charIndex: Double = .zero
        let titleText: String = Constants.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }

    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - @IBActions -
    @IBAction func registerDidPressed(_ sender: Any) {
        let registerViewModel: RegisterViewModel = RegisterViewModel()
        let viewController: UIViewController = RegisterViewController(viewModel: registerViewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func loginDisPressed(_ sender: Any) {
        let viewModel: LoginViewModel = LoginViewModel()
        let viewController: UIViewController = LoginViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
