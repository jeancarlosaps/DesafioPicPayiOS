//
//  ViewController.swift
//  DesafioPicPayiOS
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 15/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
  
  //MARK: - Properties
  var contacts: Contacts?
  
  //MARK: - IBOutlets
  @IBOutlet weak var tfSearchContacts: UITextField!
  
  //MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  //MARK: - Configure Methods
  private func configureTextField() {
    tfSearchContacts.keyboardType = .default
    tfSearchContacts.resignFirstResponder()
    tfSearchContacts.autocorrectionType = UITextAutocorrectionType.no
    tfSearchContacts.delegate = self
  }
  
  
}

extension ContactsViewController: UITextFieldDelegate {
  
}
