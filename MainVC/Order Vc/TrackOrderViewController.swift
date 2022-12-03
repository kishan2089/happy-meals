//
//  trackOrderViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 23/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class TrackOrderViewController: baseViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var lblR1: UIView!
    @IBOutlet weak var lblR2: UIView!
    @IBOutlet weak var lblR3: UIView!
    @IBOutlet weak var lblR4: UIView!
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var btnCancleOrder: UIButton!
    
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK:- Fuction
    func setUI() {
        lblR1.addCornerRadius(lblR1.frame.height / 2)
        lblR2.addCornerRadius(lblR1.frame.height / 2)
        lblR3.addCornerRadius(lblR1.frame.height / 2)
        lblR4.addCornerRadius(lblR1.frame.height / 2)
        btnCancleOrder.addCornerRadius(btnCancleOrder.frame.height / 2)
        imgPerson.addCornerRadius(10)
    }
    
    //MARK:- Action
    @IBAction func btnCancleOder(_ sender: Any) {
        let next = emptyViewController.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(next, animated: true)
    }
    @IBAction func btnChats(_ sender: Any) {
        
    }
}
