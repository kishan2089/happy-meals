//
//  burgerdetailViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 22/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class BurgerdetailViewController: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var burgerView: UIView!
    @IBOutlet weak var tblBurgerDetails: UITableView!
    
    //MARK:- Propetry
    var tImgarray = ["b1-1","b6","vadapav","b7","b2"]
    var tNamearray = ["Burger Queen","Really Cool","Vadapav Burger","Just Eat Burger","Awesome Burger"]
    var btnTag = 0
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setuiradius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- function
    func setuiradius () {
        burgerView.addCornerRadius(20)
        self.tblBurgerDetails.register(BurgerDetailTableViewCell.nib, forCellReuseIdentifier: BurgerDetailTableViewCell.identifier)
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension BurgerdetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tImgarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nnext = tableView.dequeueReusableCell(withIdentifier: "BurgerDetailTableViewCell", for: indexPath) as! BurgerDetailTableViewCell
        nnext.imgBurger.image = UIImage(named: tImgarray[indexPath.row])
        nnext.lblTilte.text = tNamearray[indexPath.row]
        nnext.btnOfferrs.addCornerRadius(10)
        nnext.imgBurger.addCornerRadius(10)
        
        if indexPath.row == 0 {
            nnext.btnOfferrs.isHidden = false
        }
        nnext.btnHaert.addTarget(self, action: #selector(self.btnTap), for: .touchUpInside)
        return nnext
    }
    
    //MARK:- LikeButton Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        btnTag = indexPath.row
    }
    
    @objc func btnTap(sender: UIButton) {
        print("Button taped", btnTag)
        if sender.isSelected {
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

