//
//  Loginpage.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 18/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class Loginpage: baseViewController {
    
    //MARK:-Outlets
    
    @IBOutlet weak var ttxtemail: UITextField!
    @IBOutlet weak var txtpasss: UITextField?
    @IBOutlet weak var Loginbtn: UIButton!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Function
    func setupUI () {
        Loginbtn.addCornerRadius(20)
        ttxtemail.applyBorder(0.1, borderColor: .gray)
        ttxtemail.addLeftPadding(padding: 20)
        ttxtemail.addCornerRadius(20)
        ttxtemail.addShadow()
        
        txtpasss?.applyBorder(0.1, borderColor: .gray)
        txtpasss?.addLeftPadding(padding: 20)
        txtpasss?.addRightPadding(padding: 20)
        txtpasss?.addCornerRadius(20)
        txtpasss?.addShadow()
        txtForgetPassword()
    }
    
    func txtForgetPassword() {
        txtpasss?.rightViewMode = .always
        txtpasss?.translatesAutoresizingMaskIntoConstraints = false
        
        let btnpass = UIButton(type: .system)
        btnpass.setTitle("Forgot?", for: .normal)
        btnpass.setTitleColor(.systemPink, for: .normal)
        //   btnpass.addLeftPadding.20
        btnpass.addTarget(self, action: #selector(tapForgetBtn), for: .touchUpInside)
        btnpass.translatesAutoresizingMaskIntoConstraints = false
        
        txtpasss?.rightView = btnpass
        txtpasss?.setNeedsLayout()
        txtpasss?.layoutIfNeeded()
    }
    
    @objc func tapForgetBtn () {
        let nextForgetpage = Forgetpassword.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nextForgetpage, animated: true)
    }
    
    //MARK:- Actions
    @IBAction func onBtnSignUp(_ sender: Any) {
        let nextForgetpage = CreateAccountViewVC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nextForgetpage, animated: true)
    }
}
