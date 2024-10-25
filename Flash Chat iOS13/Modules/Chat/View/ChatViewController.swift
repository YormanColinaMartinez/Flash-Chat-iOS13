//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Apple on 17/10/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    //MARK: - @IBOutlets -
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var messageTextView: UITextView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var customTopView: UIView!
    
    //MARK: - Properties -
    var labelPlaceholder: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.writeHere
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16,weight: .light)
        return label
    }()
    var viewModel: ChatViewModel
    
    //MARK: - Initializers -
    init(viewModel: ChatViewModel) {
        self.viewModel = viewModel
        super.init(nibName: ChatViewController.nibName(), bundle: nil)
        self.viewModel.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Private Methods -
    private func addConstraints() {
        NSLayoutConstraint.activate([
            labelPlaceholder.leadingAnchor.constraint(equalTo: messageTextView.leadingAnchor, constant: 10),
            labelPlaceholder.widthAnchor.constraint(equalTo: messageTextView.widthAnchor),
            labelPlaceholder.topAnchor.constraint(equalTo: messageTextView.topAnchor, constant:
                                                    10),
            labelPlaceholder.bottomAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: 10)
        ])
    }
    
    private func configureView() {
        tableView.backgroundColor = .clear
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .systemGray6
        containerView.backgroundColor = UIColor(named: Constants.BrandColors.blue)
        titleLabel.text = Constants.appName
        titleLabel.font = .systemFont(ofSize: 18)
        messageTextView.font = .systemFont(ofSize: 18)
        messageTextView.addSubview(labelPlaceholder)
        messageTextView.delegate = self
        messageTextView.layer.cornerRadius = messageTextView.frame.size.height / 2
        messageTextView.textColor = .gray
    }
    
    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        viewModel.loadMessages()
        addConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoSeMostro(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoSeOculto), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func scrollToRow() {
        let indexPath: IndexPath = IndexPath(row: viewModel.messages.count - 1, section: .zero)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
    }
    
    func emptyTextField() {
        self.messageTextView.text = Strings.empty
    }
    
    //MARK: - @IBActions -
    @objc func tecladoSeMostro(_ notification: Notification) {
        if let userInfo: [AnyHashable: Any] = notification.userInfo,
           let keyboardFrame: CGRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            customTopView.frame.origin.y += keyboardFrame.height
            tableView.contentInset.top = keyboardFrame.height
            tableView.verticalScrollIndicatorInsets.top = keyboardFrame.height
        }
    }

    @objc func tecladoSeOculto() {
        customTopView.frame.origin.y = .zero
        tableView.contentInset.top = .zero
        tableView.verticalScrollIndicatorInsets.top = .zero
}

    @IBAction func sendPressed(_ sender: UIButton) {
        guard let text: String = messageTextView.text else { return }
        viewModel.sendMessage(message: text)
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch  {
            print(error.localizedDescription)
        }
    }
}

//MARK: - Extension UITableViewDataSource -
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message: Message = viewModel.messages[indexPath.row]
        let cell: MessageCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.mesageConfiguration(
            with: message.sender == Auth.auth().currentUser?.email,
            message: message.body,
            imageUrl: URL(string: viewModel.messages[indexPath.row].photoURL ?? Strings.empty)
        )
        return cell
    }
}

//MARK: - Extension UITextViewDelegate -
extension ChatViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        labelPlaceholder.isHidden = !textView.text.isEmpty
    }
}
