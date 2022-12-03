//
//  bburgerDetailTableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 22/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class BurgerDetailTableViewCell: UITableViewCell {

   //MARK:- Outlets
    @IBOutlet weak var imgBurger: UIImageView!
    @IBOutlet weak var lblTilte: UILabel!
    @IBOutlet weak var btnOfferrs: UIButton!
    @IBOutlet weak var btnHaert: UIButton!

    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        btnOfferrs.isHidden = true
         self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Actions
    @IBAction func btnOffes(_ sender: Any) {
    
    }
}
