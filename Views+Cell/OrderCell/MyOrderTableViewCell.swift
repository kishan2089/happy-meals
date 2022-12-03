//
//  myOrderTableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 22/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class MyOrderTableViewCell: UITableViewCell {
 
 //MARK:- Outlets
    @IBOutlet weak var lblTile: UILabel!
    @IBOutlet weak var lblPrize: UILabel!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK:- Function
    func Config(Title: String,Prize: String) {
        lblTile.text = Title
        lblPrize.text = Prize
       }
}
