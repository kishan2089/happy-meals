//
//  myOrderViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 22/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class MyOrderViewController: baseViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var imgLable: UIImageView!
    @IBOutlet weak var tblMyorder: UITableView!
    @IBOutlet weak var btnCheackOut: UIButton!
    
    //MARK:- Property
    private let viewModel =  MyOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    //MARK:- Function
    func setUI () {
        imgLable.addCornerRadius(10)
        btnCheackOut.layer.cornerRadius = 22.0
        self.tblMyorder.register(MyOrderTableViewCell.nib, forCellReuseIdentifier: MyOrderTableViewCell.identifier)
    }
    
    //MARK:- Action
    @IBAction func btnCheackOut(_ sender: Any) {
        let nexthome = CheckOutViewController.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nexthome, animated: true)
    }
}

//MARK:-UITableViewDelegate, UITableViewDataSource
extension MyOrderViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nnext = tableView.dequeueReusableCell(withIdentifier: "MyOrderTableViewCell", for: indexPath) as! MyOrderTableViewCell
        let data = viewModel.dataModel[indexPath.row]
        
        nnext.Config(Title: data.title!, Prize: data.prie!)
        return nnext
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
