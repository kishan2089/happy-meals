//
//  popularTableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 21/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrizze: UILabel!
    @IBOutlet weak var popularStackView: UIStackView!
  
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        popularStackView.isHidden = true
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
