//
//  HeaderVeritiseCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 26/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class HeaderVeritiseCell: UITableViewCell {
    
    //MARK:- Outlet
    @IBOutlet weak var lblHeader: UILabel!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
