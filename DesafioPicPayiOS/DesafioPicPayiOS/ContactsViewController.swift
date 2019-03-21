//
//  ViewController.swift
//  DesafioPicPayiOS
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 15/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import Foundation

class ContactsViewController: UIViewController {
  
  //MARK: - Properties
  var contacts: [Contacts] = []
  
  //MARK: - IBOutlets
  @IBOutlet weak var tfSearchContacts: UITextField!
  @IBOutlet weak var tbContacts: UITableView!
  
  //MARK: - Super Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    loadContacts()
    configureTextField()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .default
  }

  //MARK: - Configure Methods
  private func configureTextField() {
    tfSearchContacts.keyboardType = .default
    tfSearchContacts.resignFirstResponder()
    tfSearchContacts.autocorrectionType = UITextAutocorrectionType.no
    tfSearchContacts.delegate = self
  }
  
  func configureTableView() {
    tbContacts.estimatedRowHeight = 115
    tbContacts.rowHeight = UITableView.automaticDimension
  }
  
  //MARK: - Internal Methods
  func loadContacts() {
    ContactAPI.loadContacts { contacts in
      guard let list = contacts else { return }
      
      self.contacts.append(contentsOf: list)
      
      DispatchQueue.main.async {
        self.tbContacts.reloadData()
      }
    }
  }
  
}

extension ContactsViewController: UITextFieldDelegate {
  
}

extension ContactsViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return contacts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! ContactsTableViewCell
    
    let contact = contacts[indexPath.row]
    cell.configureCell(with: contact)
    
    return cell
  }
}

extension ContactsViewController: UITableViewDelegate { }
