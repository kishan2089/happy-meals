//
//  Create Account.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 18/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class CreateAccountViewVC: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtphone: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Functions
    func setupUI () {
        btnLogin.addCornerRadius(20)
        txtusername.applyBorder(0.1, borderColor: .gray)
        txtusername.addLeftPadding(padding: 20)
        txtusername.addCornerRadius(20)
        txtusername.addShadow()
        
        txtEmail.applyBorder(0.1, borderColor: .gray)
        txtEmail.addLeftPadding(padding: 20)
        txtEmail.addCornerRadius(20)
        txtEmail.addShadow()
        
        txtpassword.applyBorder(0.1, borderColor: .gray)
        txtpassword.addLeftPadding(padding: 20)
        txtpassword.addCornerRadius(20)
        txtpassword.addShadow()
        
        txtphone.applyBorder(0.1, borderColor: .gray)
        txtphone.addLeftPadding(padding: 20)
        txtphone.addCornerRadius(20)
        txtphone.addShadow()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 2 && textField.text != "@gmail.com" {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 5
        } else {
            textField.backgroundColor = UIColor.white
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 1
        }
    }
    
    //MARK:- Actions
    
    @IBAction func onBtnLogin(_ sender: Any) {
        let nextForgetpage = Loginpage.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nextForgetpage, animated: true)
    }
    
}

