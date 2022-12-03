//
//  baseViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 29/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class baseViewController: UIViewController {
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Function    //tabbar function
    func showTabBar() {
        if let tabBarVC = navigationController?.tabBarController as? CustomeTabbarController {
            tabBarVC.setTabBarHidden(tabBarHidden: false, vc: self)
        }
    }
    
    func hideTabBar() {
        if let tabBarVC = navigationController?.tabBarController as? CustomeTabbarController {
            tabBarVC.setTabBarHidden(tabBarHidden: true, vc: self)
        }
    }
    
    //MARK:- Action
    @IBAction func bckBtn(_sender: Any){
        navigationController?.popViewController(animated: true)
    }
}
