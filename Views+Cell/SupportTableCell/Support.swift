//
//  Support.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class Support: UITableViewCell {

    //MARK:- Outlet
    @IBOutlet weak var lblSupport: UILabel!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
         self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
