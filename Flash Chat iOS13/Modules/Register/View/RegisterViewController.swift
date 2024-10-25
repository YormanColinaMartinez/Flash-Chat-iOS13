//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Apple on 18/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class RegisterViewController: UIViewController {
    
    //MARK: - @IBOutlets -
    @IBOutlet private weak var emailTextfield: UITextField!
    @IBOutlet private weak var passwordTextfield: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var googleButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailContainerView: UIView!
    @IBOutlet private weak var passwordContainerView: UIView!
    
    //MARK: - Private Properties -
    private var viewModel: RegisterViewModel
    
    //MARK: - Initializers -
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: RegisterViewController.nibName(), bundle: nil)
        self.viewModel.viewController = self
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
        view.backgroundColor = UIColor(named: Constants.BrandColors.lighBlue)
        titleLabel.text = Constants.appName
        titleLabel.font = .systemFont(ofSize: 41, weight: .black)
        titleLabel.textColor = UIColor(named: Constants.BrandColors.blue)
        registerButton.setTitle(Strings.register, for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        ConfigurationAppView.setButtonAttributted(
            registerButton,
            title: Strings.register,
            size: 24
        )
        ConfigurationAppView.inputButtonCofiguration(
            with: registerButton,
            textColor: UIColor(named: Constants.BrandColors.lighBlue),
            backgroundColor: UIColor(named: Constants.BrandColors.blue),
            isCircularButton: false
        )
        ConfigurationAppView.inputButtonCofiguration(
            with: googleButton,
            textColor: nil,
            backgroundColor: .white,
            isCircularButton: true
        )
        ConfigurationAppView.inputTextFieldViewConfiguration(with: emailContainerView)
        ConfigurationAppView.inputTextFieldViewConfiguration(with: passwordContainerView)
        emailTextfield.placeholder = Strings.email
        passwordTextfield.placeholder = Strings.password
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func showChat() {
        let viewModel: ChatViewModel = ChatViewModel()
        let chatViewController: ChatViewController = ChatViewController(viewModel: viewModel)
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    //MARK: - @IBActions -
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email: String = emailTextfield.text,
                let password: String = passwordTextfield.text else { return }
        viewModel.registerUser(email: email, password: password)
    }
    
    @IBAction func googleSignInButton(_ sender: Any) {
        viewModel.googleAuth()
    }
}
