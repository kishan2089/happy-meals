//
//  settingTableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 23/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    //MARK:- Outlet
    
    @IBOutlet weak var lblSettingList: UILabel!
    @IBOutlet weak var lblOption: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
