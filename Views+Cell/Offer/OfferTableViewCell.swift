//
//  offerTableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 20/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

   //MARK:- Outlets
    @IBOutlet weak var imgOffer: UIImageView!
    @IBOutlet weak var lblOffertitle: UILabel!
    @IBOutlet weak var lblCafe: UILabel!
    @IBOutlet weak var lblMin: UILabel!
   
    //MARK:- LifeCycle
    // nib load function
    override func awakeFromNib() {
        super.awakeFromNib()
         self.selectionStyle = .none
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
          setUpUi()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Function
    func setUpUi() {
        lblMin.addCornerRadius(lblMin.frame.height / 2)
    }
}
