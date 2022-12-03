//
//  selfDelegateController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 29/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SelfDelegateController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblView: UITableView!
    
    //MARK:- Property
    var arrHeading = ["1","2","3","4","5","6","7"]
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.register(SelfDelegateTableCell.nib, forCellReuseIdentifier: SelfDelegateTableCell.identifier)
    }
}

//MARK:-  UITableViewDataSource, UITableViewDelegate, self Delegate Methods
extension SelfDelegateController: UITableViewDataSource, UITableViewDelegate ,BurgerCategoryTableViewCellDelegate {
    func burgerCategoryTableViewCellDidSelectViewAll(at index: Int) {
        print(index)
    }
    
    func burgerCategoryTableViewCellDidSelect(at indexPath: IndexPath) {
        print(indexPath)
    }
    
    //MARK:- UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHeading.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nnext = tableView.dequeueReusableCell(withIdentifier: "SelfDelegateTableCell", for: indexPath) as! SelfDelegateTableCell
        nnext.delegate = self
        nnext.lblTblHeading.text = arrHeading[indexPath.row]
        nnext.btnSee.addTarget(self, action: #selector(tapSeeAll), for: .touchUpInside)
        return nnext
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    @objc func tapSeeAll () {
        print("Clicked")
    }
}

