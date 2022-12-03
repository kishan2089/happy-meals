//
//  homeCollectionViewCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 19/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var collectionCellview: UIView!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setBonds()
    }
    
    //MARK:- Function
    func setBonds() {
        collectionCellview.addCornerRadius(5)
    }
    
    func Config(Img: String,ImageName: String) {
        categoryImg.image = UIImage(named: Img)
        lblCategory.text = ImageName
    }
}
