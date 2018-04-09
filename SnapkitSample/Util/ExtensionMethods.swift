//
//  ExtensionMethods.swift
//  SnapkitSample
//
//  Created by Naren on 03/04/18.
//  Copyright © 2018 naren. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: UITextFieldDelegate{
  func addToolBar(textField: UITextField){
    let toolBar = UIToolbar()
    toolBar.barStyle = .default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
    doneButton.tintColor = UIColor.black
    let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolBar.setItems([spaceButton,doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    toolBar.sizeToFit()
    textField.delegate = self
    textField.inputAccessoryView = toolBar
  }
 
  @objc func donePressed(){
    view.endEditing(true)
  }
  
}
