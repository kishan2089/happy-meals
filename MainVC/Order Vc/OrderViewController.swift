//
//  orderViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 23/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class OrderViewController: baseViewController {
    
    //MAMRK:- Outlet
    @IBOutlet weak var btnTrack: UIButton!
    @IBOutlet weak var viewOrder: UIView!
    
    //MARK:- Property
    var superVc = CheckOutViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK:- Function
    func setUI() {
        btnTrack.addCornerRadius(btnTrack.frame.height / 2) 
        viewOrder.addCornerRadius(20)
    }
    
    //MARK:- Action
    @IBAction func onBtnTrackk(_ sender: Any) {
        let nexthome = TrackOrderViewController.instantiate(fromAppStoryboard: .Order)
        self.dismiss(animated:true,completion:nil)
        self.superVc.navigationController?.pushViewController(nexthome, animated: true)
    }
    @IBAction func onBtnElse(_ sender: Any) {
        self.dismiss(animated:true,completion:nil)
    }
    
}
