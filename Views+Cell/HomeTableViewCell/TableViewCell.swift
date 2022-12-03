//
//  TableViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 19/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var tbleImg: UIImageView!
    @IBOutlet weak var tblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTotalrating: UILabel!
    @IBOutlet weak var lblRestrotype: UILabel!
    @IBOutlet weak var lblFoodtype: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
         self.selectionStyle = .none
    }
    
   //MARK:- Function
    func Config(Img:String,Name:String,Rating:String,Totalrate:String,Typeofrestro:String,Foodtype:String) {
        tbleImg.image = UIImage(named: Img)
        tblTitle.text = Name
        lblRating.text = Rating
        lblTotalrating.text = Totalrate
       // lblRestrotype.text = Typeofrestro
        lblFoodtype.text = Foodtype
    }
}
