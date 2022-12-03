//
//  PagerViewCel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit
import FSPagerView

class PagerViewCel: FSPagerViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config (Title: String, Detail:String, Image: String ) {
        lblTitle.text = Title
        lblDescription.text = Detail
        imgView.image = UIImage(named: Image)
    }

}
