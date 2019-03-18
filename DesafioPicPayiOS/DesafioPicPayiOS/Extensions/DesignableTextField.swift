//
//  DesignableTextField.swift
//  DesafioPicPayiOS
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 18/03/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

  @IBInspectable var leftImage: UIImage? {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable var leftPadding: CGFloat = 0 {
    didSet{
      updateView()
    }
  }
  
  func updateView() {
    if let image = leftImage {
      leftViewMode = .always
      
      let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
      imageView.image = image
      
      let width = leftPadding - 50
      
      let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
      view.addSubview(imageView)
      
      leftView = view
    } else {
      
      leftViewMode = .never
    }
  }

}
