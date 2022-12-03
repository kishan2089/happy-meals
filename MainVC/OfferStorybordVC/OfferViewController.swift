//
//  offerViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 20/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class OfferViewController: baseViewController{
    
    
    
    //MARK:- Outlet
    
    @IBOutlet weak var btnOffer: UIButton!
    @IBOutlet weak var offerTbleview: UITableView!
    
    //MARK:- Property
    
    var tblImg = ["chinese-1","Japanesefood","mcdonalds"]
    var tblTitleName = ["Chinese Cafe","Real Japaness","Burgerking"]
    var tblTypeofrestro = ["Cafe","Pestry Shop","Pizza Zone","SteedFood"]
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addRadius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showTabBar()
    }
    
    //MARK:- Functions
    func addRadius() {
        btnOffer.addCornerRadius(btnOffer.frame.height / 2)
        offerTbleview.addCornerRadius(20)
        self.offerTbleview.register(OfferTableViewCell.nib, forCellReuseIdentifier: OfferTableViewCell.identifier)
    }
}

//MARK:-  UITableViewDataSource, UITableViewDelegate
extension OfferViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mycell = tableView.dequeueReusableCell(withIdentifier: "OfferTableViewCell", for: indexPath) as! OfferTableViewCell
        
        mycell.imgOffer.image = UIImage(named: tblImg[indexPath.row])
        mycell.lblOffertitle.text = tblTitleName[indexPath.row]
        mycell.imgOffer.addCornerRadius(5)
        mycell.lblCafe.text = tblTypeofrestro[indexPath.row]
        mycell.lblMin.layer.cornerRadius = 10
        mycell.lblMin.layer.masksToBounds = true
        return mycell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
}
