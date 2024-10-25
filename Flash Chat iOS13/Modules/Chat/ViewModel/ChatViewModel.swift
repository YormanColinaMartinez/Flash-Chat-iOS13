//
//  ChatViewModel.swift
//  Flash Chat iOS13
//
//  Created by Apple on 17/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ChatViewModel {
    
    //MARK: - Properties -
    let dataBase: Firestore = Firestore.firestore()
    var messages: [Message] = []
    var viewController: ChatViewController?
    
    //MARK: - Methods -
    func loadMessages() {
        dataBase.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                
            self.messages = []
                
            if let error {
                print(error)
            } else {
                if let snapshotDocuments: [QueryDocumentSnapshot] = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let sender: String = data[Constants.FStore.senderField] as? String,
                           let messageBody: String = data[Constants.FStore.bodyField] as? String,
                           let photoUrl: String = data[Constants.FStore.photoURL] as? String
                        {
                            let newMessage: Message = Message(sender: sender, body: messageBody, photoURL: photoUrl)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.viewController?.reloadTableView()
                                self.viewController?.scrollToRow()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func sendMessage(message: String) {
        if let messageSender: String = Auth.auth().currentUser?.email, message != Strings.empty {
            dataBase.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField: messageSender,
                Constants.FStore.bodyField: message,
                Constants.FStore.dateField: Date().timeIntervalSince1970,
                Constants.FStore.photoURL: Auth.auth().currentUser?.photoURL?.absoluteString ?? Strings.empty
            ]) { error in
                if let error {
                    print(error)
                } else {
                    DispatchQueue.main.async {
                        self.viewController?.emptyTextField()
                    }
                }
            }
        }
    }
}
