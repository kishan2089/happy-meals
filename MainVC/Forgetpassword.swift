//
//  Forgetpassword.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 18/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class Forgetpassword: baseViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSet: UIButton!
    
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
        txtEmail.applyBorder(0.1, borderColor: .gray)
        txtEmail.addLeftPadding(padding: 20)
        txtEmail.addCornerRadius(20)
        txtEmail.addShadow()
        btnSet.addCornerRadius(20)
    }
    
    //MARK:- Actions
    @IBAction func onBtnSend(_ sender: Any) {
        let nexthome = HomePage.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nexthome, animated: true)
    }
}
