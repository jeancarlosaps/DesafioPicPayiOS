//
//  ContactsTableViewCell.swift
//  DesafioPicPayiOS
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 18/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import Kingfisher

class ContactsTableViewCell: UITableViewCell {
  
  //MARK: - Properties
  
  //MARK: - IBOutlets
  @IBOutlet weak var imgContact: UIImageView!
  @IBOutlet weak var lblUserName: UILabel!
  @IBOutlet weak var lblName: UILabel!
  
  //MARK: - Super Methods
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  //MARK: - Internal Methods
  func configureCell(with contact: Contacts) {
    lblUserName.text = contact.username
    lblName.text = contact.name
    
    //Download Images
    if let url = URL(string: contact.img) {
      imgContact.kf.indicatorType = .activity
      imgContact.kf.setImage(with: url)
    } else {
      imgContact.image = nil
    }
    
    imgContact.layer.cornerRadius = imgContact.frame.size.height/2
    imgContact.layer.borderColor = UIColor.black.cgColor
    imgContact.layer.borderWidth = 1
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
