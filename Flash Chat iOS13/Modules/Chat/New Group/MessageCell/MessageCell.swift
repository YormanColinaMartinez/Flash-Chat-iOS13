//
//  MessageCellTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Yorman Colina on 10/10/2024.

import UIKit

class MessageCell: UITableViewCell {
    
    //MARK: - @IBOutlets -
    @IBOutlet private weak var messageBubbleView: UIView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var rigthImageView: UIImageView!
    @IBOutlet private weak var leftImageView: UIImageView!
    
    //MARK: - Methods -
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leftImageView.image = UIImage(named: Icons.emptyPhoto)
        rigthImageView.image = UIImage(named: Icons.meAvatarIcon)
        label.text = nil
    }
    
    func setUpCell() {
        backgroundColor = .clear
        messageBubbleView.layer.cornerRadius = messageBubbleView.frame.size.height / 5
        rigthImageView.layer.cornerRadius = rigthImageView.frame.size.height / 2
        leftImageView.layer.cornerRadius = leftImageView.frame.size.height / 2
    }
    
    func mesageConfiguration(with value: Bool, message: String, imageUrl: URL?) {
        addDinamicConstraints(value: value)
        leftImageView.isHidden = value
        rigthImageView.isHidden = !value
        messageBubbleView.backgroundColor = UIColor(named: value ? Constants.BrandColors.lightPurple : Constants.BrandColors.purple)
        messageBubbleView.layer.shadowOffset = CGSize(width: -3, height: 3)
        messageBubbleView.layer.shadowColor = UIColor.black.cgColor
        messageBubbleView.layer.shadowOpacity = 0.1
        label.textColor = UIColor(named: value ? Constants.BrandColors.purple : Constants.BrandColors.lightPurple)
        label.text = message
        if let imageUrl, imageUrl.absoluteString != Strings.empty {
            setUpImage(from: imageUrl, currentUser: value)
        } else {
            
        }
    }
    
    func setUpImage(from url: URL, currentUser: Bool) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            if let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 {
                guard let data = data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    if currentUser {
                        self.rigthImageView.image = image
                    } else {
                        self.leftImageView.image = image
                    }
                }
            }
        }.resume()
    }
    
    func addDinamicConstraints(value: Bool) {
        messageBubbleView.translatesAutoresizingMaskIntoConstraints = false
        if value {
            NSLayoutConstraint.activate([
                messageBubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 50)
            ])
        } else {
            NSLayoutConstraint.activate([
                messageBubbleView.trailingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 50)
            ])
        }
    }
}
