//
//  settingViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SettingViewController: baseViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var imgPerson: UIImageView!
    @IBOutlet weak var tblSetting: UITableView!
    
    //MARK:- Property
    var settingAray = ["Profile","Payment Method","Order History","Delivery address","Setting","About us","Support"]
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showTabBar()
    }
    
    //MARK:-Function
    func setUI () {
        imgPerson.addCornerRadius(imgPerson.frame.height / 2)
        
        self.tblSetting.register(SettingTableViewCell.nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingAray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nnext = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        nnext.lblSettingList.text = settingAray[indexPath.row]
        
        return nnext
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6{
            let nexthome = SupportViewController.instantiate(fromAppStoryboard: .Setting)
            self.navigationController?.pushViewController(nexthome, animated: true)
        }
    }
    
}
