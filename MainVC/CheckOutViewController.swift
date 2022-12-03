//
//  checkOutViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 23/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class CheckOutViewController: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var btnCheckOut: UIButton!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK:- Function
    func setUI() {
        btnCheckOut.addCornerRadius(btnCheckOut.frame.height / 2)
    }
    
    //MARK:- Action
    @IBAction func onBtnSendOrder(_ sender: Any) {
        let nexthome = OrderViewController.instantiate(fromAppStoryboard: .Order)
        nexthome.superVc = self
        nexthome.modalPresentationStyle = .overFullScreen         // multipal screen in one viewController
        self.present(nexthome,animated:false,completion:nil)
    }
}
