//
//  supportViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SupportViewController: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var serchBar: UISearchBar!
    @IBOutlet weak var viewLiveChats: UIView!
    @IBOutlet weak var supportTable: UITableView!
    
    //MARK:- Property
    var viewModel = SupportHeaderViewModel()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Function
    func setupUi() {
        serchBar.addCornerRadius(40)
        serchBar.clipsToBounds  = true
        serchBar .addShadow()
        viewLiveChats.addShadowToSpecificCorner(top: false, left: false, bottom: true, right: true, shadowRadius: 8)
        self.supportTable.register(Support.nib, forCellReuseIdentifier: Support.identifier)
        self.supportTable.register(SupportHeader.nib, forCellReuseIdentifier: SupportHeader.identifier)
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension SupportViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nnext = tableView.dequeueReusableCell(withIdentifier: "SupportHeader") as! SupportHeader
        nnext.lblHeader.text = viewModel.arrSupportHeading[section].rawValue
        return nnext
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return  viewModel.arrFrequntlyaskedquestions.count
            
        case 1:
            return viewModel.arrPaymentMethods.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Support", for: indexPath) as! Support
        
        switch indexPath.section {
        case 0:
            cell.lblSupport.text = viewModel.arrFrequntlyaskedquestions[indexPath.row].rawValue
            
            return cell
        case 1:
            cell.lblSupport.text = viewModel.arrPaymentMethods[indexPath.row].rawValue
            return cell
            
        default:
            break
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
