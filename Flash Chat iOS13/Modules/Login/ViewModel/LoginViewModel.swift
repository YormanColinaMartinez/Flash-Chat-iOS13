//
//  LoginViewModel.swift
//  Flash Chat iOS13
//
//  Created by Apple on 17/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class LoginViewModel {
    
    //MARK: - Properties -
    var viewController: LoginViewController?
    
    //MARK: - Methods -
    func googleAuth() {
        guard let clientID: String = FirebaseApp.app()?.options.clientID else { return }
        
        let config: GIDConfiguration = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let viewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
            guard error == nil, let user = result?.user, let idToken = user.idToken?.tokenString else { return }
            
            let credential: AuthCredential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { result, error in
                if let error {
                    print(error.localizedDescription)
                } else {
                    viewController.showChat()
                }
            }
        }
    }
    
    func loginAuth(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResutl, error in
            if let error {
                print( error.localizedDescription)
            } else {
                self.viewController?.showChat()
            }
        }
        
    }
}
