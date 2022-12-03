//
//  sortCollectionCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 28/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SortCollectionCell: UICollectionViewCell {
    
    //MARK:- Outlet
    @IBOutlet weak var lblSortTitle: UILabel!
    @IBOutlet weak var viewSort: UIView!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        SetUI()
   }
    override func layoutSubviews() {
        super.layoutSubviews()
        viewSort.addCornerRadius(viewSort.frame.height / 2)
    }
    
    //MARK:-Function
    func SetUI() {
//        ViewSort.addCornerRadius(ViewSort.frame.height / 2)
    }
  
    func setSelected(isSelected: Bool, isSelectionModeEnabled: Bool) {
            
           if isSelected == true {
            lblSortTitle.textColor = .white
            viewSort.backgroundColor = .systemPink
           }
           else{
            lblSortTitle.textColor = .black
            viewSort.backgroundColor = .white
           }
       }
}
