//
//  ViewController.swift
//  SnapkitSample
//
//  Created by Naren on 02/04/18.
//  Copyright © 2018 naren. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  let imageView = UIImageView.init()
  let horizontalLineView = UIView()
  let horizontalSecondLineView = UIView()
  let emailTextfield = UITextField()
  let passwordTextfield = UITextField()
  let coverViewForAlreadyMember = UIView()
  let logInButton = UIButton()
  let forgotPassword = UIButton()
  var tapCount = 0
  let stackView   = UIStackView()
  let gitLabel : UILabel = {
    let gitCommitLabel = UILabel()
    gitCommitLabel.textColor = UIColor.white
    gitCommitLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 16)
    gitCommitLabel.textAlignment = .center
    return gitCommitLabel
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if  let git = Bundle.main.infoDictionary!["GIT_COMMIT_HASH"]{
      print(git)
    }
      self.view.addSubview(gitLabel)
      let gitCommitText = gitLabel
//      gitCommitText.text = "\(git)"
      gitCommitText.snp.makeConstraints { (commitText) in
        commitText.top.equalToSuperview().offset(-50)
        commitText.left.equalTo(10)
        commitText.right.equalTo(-10)
        commitText.height.equalTo(30)
      }
    
    self.view.backgroundColor = UIColor.black
    self.emailTextfield.isHidden = true
    self.passwordTextfield.isHidden = true
    self.stackView.isHidden = true
    buildingHubLogo()
    getNotificationAlreadyMemberLabel()
    emailPasswordTextfields()
    textfieldProperties()
    tapGestureForCoverView()
    self.view.backgroundColor = CustomColors.hexStringToUIColor(hex: "2C2C2C")
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func textfieldProperties(){
    emailTextfield.delegate = self
    passwordTextfield.delegate = self
    addToolBar(textField: emailTextfield)
    addToolBar(textField: passwordTextfield)
  }
  
  func buildingHubLogo(){
    imageView.image = #imageLiteral(resourceName: "logo")
    self.view.addSubview(imageView)
    imageView.snp.makeConstraints { (imgviewConstraint) in
      imgviewConstraint.top.equalToSuperview().offset(40)
      imgviewConstraint.left.equalToSuperview().offset(30)
      imgviewConstraint.right.equalToSuperview().offset(-30)
      imgviewConstraint.height.equalTo(250)
    }
    imageView.backgroundColor = UIColor.gray
  }
  
  func getNotificationAlreadyMemberLabel(){
    let getNotificationLabel = UILabel()
    getNotificationLabel.text = "GET NOTIFICATIONS"
    getNotificationLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 35)
    getNotificationLabel.textColor = CustomColors.hexStringToUIColor(hex: "F19838")
    self.view.addSubview(getNotificationLabel)
    getNotificationLabel.snp.makeConstraints { (getNotification) in
      getNotification.top.equalTo(imageView.snp.bottom).offset(50)
      getNotification.left.equalTo(imageView.snp.left)
      getNotification.right.equalTo(imageView.snp.right)
    }
    let clickHereLabel = UILabel.init()
    clickHereLabel.text = "CLICK HERE"
    clickHereLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 25)
    clickHereLabel.textColor = UIColor.white
    self.view.addSubview(clickHereLabel)
    clickHereLabel.snp.makeConstraints { (clickHere) in
      clickHere.top.equalTo(getNotificationLabel.snp.bottom).offset(2)
      clickHere.left.equalTo(getNotificationLabel.snp.left)
      clickHere.right.equalTo(getNotificationLabel.snp.right)
    }
    horizontalLineView.backgroundColor = UIColor.white
    self.view.addSubview(horizontalLineView)
    horizontalLineView.snp.makeConstraints { (lineView) in
      lineView.top.equalTo(clickHereLabel.snp.bottom).offset(6)
      lineView.left.equalTo(imageView.snp.left)
      lineView.right.equalTo(imageView.snp.right)
      lineView.height.equalTo(1)
    }
    alreadyMemberLabel()
  }
  
  func alreadyMemberLabel(){
    let alreadyMemberLabel = UILabel.init()
    alreadyMemberLabel.text = "ALREADY A MEMBER?"
    alreadyMemberLabel.textColor = CustomColors.hexStringToUIColor(hex: "F19838")
    alreadyMemberLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 35)
    self.view.addSubview(alreadyMemberLabel)
    alreadyMemberLabel.snp.makeConstraints { (alreadyMember) in
      alreadyMember.top.equalTo(horizontalLineView.snp.bottom).offset(40)
      alreadyMember.left.equalTo(imageView.snp.left)
      alreadyMember.right.equalTo(imageView.snp.right)
    }
    let signInHereLabel = UILabel.init()
    signInHereLabel.text = "SIGN IN HERE"
    signInHereLabel.textColor = CustomColors.hexStringToUIColor(hex: "F19838")
    signInHereLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 25)
    signInHereLabel.textColor = UIColor.white
    self.view.addSubview(signInHereLabel)
    signInHereLabel.snp.makeConstraints { (signInHere) in
      signInHere.top.equalTo(alreadyMemberLabel.snp.bottom).offset(2)
      signInHere.left.equalTo(alreadyMemberLabel.snp.left)
      signInHere.right.equalTo(alreadyMemberLabel.snp.right)
    }
    horizontalSecondLineView.backgroundColor = UIColor.white
    self.view.addSubview(horizontalSecondLineView)
    horizontalSecondLineView.snp.makeConstraints { (lineView) in
      lineView.top.equalTo(signInHereLabel.snp.bottom).offset(6)
      lineView.left.equalTo(imageView.snp.left)
      lineView.right.equalTo(imageView.snp.right)
      lineView.height.equalTo(1)
    }
    coverViewForAlreadyMember.backgroundColor = UIColor.clear
    self.view.addSubview(coverViewForAlreadyMember)
    coverViewForAlreadyMember.snp.makeConstraints { (coverView) in
      coverView.top.equalTo(alreadyMemberLabel.snp.top).offset(6)
      coverView.left.equalTo(imageView.snp.left)
      coverView.right.equalTo(imageView.snp.right)
      coverView.bottom.equalTo(horizontalSecondLineView.snp.bottom)
    }
  }
  
  func tapGestureForCoverView(){
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideShowAnimation))
    coverViewForAlreadyMember.addGestureRecognizer(tapGesture)
    coverViewForAlreadyMember.isUserInteractionEnabled = true
  }
  
  func emailPasswordTextfields(){
    emailTextfield.borderStyle = .bezel
    emailTextfield.backgroundColor = UIColor.white
    emailTextfield.placeholder = "EMAIL ADDRESS"
    emailTextfield.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
    self.view.addSubview(emailTextfield)
    passwordTextfield.borderStyle = .bezel
    passwordTextfield.backgroundColor = UIColor.white
    passwordTextfield.placeholder = "PASSWORD"
    passwordTextfield.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 18)
    self.view.addSubview(passwordTextfield)
    
    emailTextfield.snp.makeConstraints { (emailfieldConstraint) in
      emailfieldConstraint.top.equalTo(horizontalSecondLineView.snp.bottom).offset(20)
      emailfieldConstraint.left.equalTo(imageView.snp.left)
      emailfieldConstraint.right.equalTo(imageView.snp.right)
      emailfieldConstraint.height.equalTo(40)
    }
    passwordTextfield.snp.makeConstraints { (passwordfieldConstraint) in
      passwordfieldConstraint.top.equalTo(emailTextfield.snp.bottom).offset(15)
      passwordfieldConstraint.left.equalTo(imageView.snp.left)
      passwordfieldConstraint.right.equalTo(imageView.snp.right)
      passwordfieldConstraint.height.equalTo(40)
    }
    logInButton.setTitle("START", for: .normal)
    logInButton.setTitleColor(CustomColors.hexStringToUIColor(hex: "F19838"), for: .normal)
    logInButton.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 23)
    forgotPassword.setTitle("Forgot Password", for: .normal)
    forgotPassword.setTitleColor(CustomColors.hexStringToUIColor(hex: "F19838"), for: .normal)
    logInButton.titleLabel?.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
    self.view.addSubview(logInButton)
    self.view.addSubview(forgotPassword)
    
    stackView.axis  = .horizontal
    stackView.distribution  = .equalSpacing
    stackView.alignment = .fill
    stackView.spacing   = 30
    self.view.addSubview(stackView)
    stackView.addArrangedSubview(forgotPassword)
    stackView.addArrangedSubview(logInButton)
    stackView.snp.makeConstraints { (stackViewConstraints) in
      stackViewConstraints.top.equalTo(passwordTextfield.snp.bottom).offset(15)
      stackViewConstraints.left.equalTo(passwordTextfield.snp.left)
      stackViewConstraints.right.equalTo(passwordTextfield.snp.right)
      stackViewConstraints.height.equalTo(50)
    }
  }
  
  @objc func hideShowAnimation(){
    tapCount += 1
    if tapCount % 2 == 0{
      UIView.transition(with: emailTextfield, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.emailTextfield.isHidden = true
      }, completion: nil)
      
      UIView.transition(with: passwordTextfield, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.passwordTextfield.isHidden = true
      }, completion: nil)
      
      UIView.transition(with: stackView, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.stackView.isHidden = true
      }, completion: nil)
    }else{
      UIView.transition(with: emailTextfield, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.emailTextfield.isHidden = false
      }, completion: nil)
      
      UIView.transition(with: passwordTextfield, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.passwordTextfield.isHidden = false
      }, completion: nil)
      
      UIView.transition(with: stackView, duration: 0.2, options: .transitionCrossDissolve, animations: {
        self.stackView.isHidden = false
      }, completion: nil)
    }
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      if self.view.frame.origin.y == 0{
        self.view.frame.origin.y -= keyboardSize.height
      }
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      if self.view.frame.origin.y != 0 {
        self.view.frame.origin.y = 0
      }
    }
  }
}


class D : Sample{
  
  
  func test(){
    
  }
  
  override func privateFuncTest() {
    
  }
}

