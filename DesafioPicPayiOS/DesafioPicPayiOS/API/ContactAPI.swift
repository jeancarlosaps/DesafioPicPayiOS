//
//  ContactAPI.swift
//  DesafioPicPayiOS
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 18/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import Foundation
import Alamofire

class ContactAPI {
  static private let baseURL = "http://careers.picpay.com/tests/mobdev/users"
  
  class func loadContacts(onComplete: @escaping (Contacts?) -> Void)  {
    let url = baseURL
    
    Alamofire.request(url).responseJSON { (response) in
      guard let data = response.data,
        let contacts = try? JSONDecoder().decode(Contacts.self, from: data) else {
          onComplete(nil)
          return
      }
      onComplete(contacts)
    }
  }
  
}
