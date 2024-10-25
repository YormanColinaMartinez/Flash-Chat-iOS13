//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Apple on 17/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class LoginViewController: UIViewController {
    
    //MARK: - @IBOutlets -
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailContainerView: UIView!
    @IBOutlet private weak var passwordContainerView: UIView!
    
    //MARK: - Private Properties -
    private var viewModel: LoginViewModel?
    
    //MARK: - Initializers -
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: LoginViewController.nibName(), bundle: nil)
        self.viewModel?.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
        navigationController?.isNavigationBarHidden = false
        titleLabel.text = Constants.appName
        titleLabel.font = .systemFont(ofSize: 41, weight: .black)
        titleLabel.textColor = UIColor(named: Constants.BrandColors.blue)
        loginButton.setTitle(Strings.login, for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        ConfigurationAppView.setButtonAttributted(loginButton, title: Strings.login, size: 24)
        ConfigurationAppView.inputButtonCofiguration(
            with: loginButton,
            textColor: UIColor(named: Constants.BrandColors.lightPurple),
            backgroundColor: UIColor(named: Constants.BrandColors.purple),
            isCircularButton: false
        )
        ConfigurationAppView.inputButtonCofiguration(
            with: googleButton,
            textColor: nil,
            backgroundColor: nil,
            isCircularButton: true
        )
        ConfigurationAppView.inputTextFieldViewConfiguration(with: emailContainerView)
        ConfigurationAppView.inputTextFieldViewConfiguration(with: passwordContainerView)
        emailTextfield.placeholder = Strings.email
        passwordTextfield.placeholder = Strings.password
    }
    
    func showChat() {
        let chatViewModel: ChatViewModel = ChatViewModel()
        navigationController?.pushViewController(ChatViewController(viewModel: chatViewModel), animated: true)
    }
    
    //MARK: - @IBActions -
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email: String = emailTextfield.text,
                let password: String = passwordTextfield.text else { return }
        viewModel?.loginAuth(email: email, password: password)
    }
    
    @IBAction func googleSignInButton(_ sender: Any) {
        guard let viewModel else { return }
        viewModel.googleAuth()
    }
}
