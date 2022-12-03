//
//  sortByTableCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 28/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class SortByTableCell: UITableViewCell {
    
    //MARK:- Outlet
    @IBOutlet weak var lblSort: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    
    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:- Function
    func setSelected(isSelected: Bool, isSelectionModeEnabled: Bool) {
        imgSelect.isHighlighted = isSelected
        imgSelect.isHidden = (isSelectionModeEnabled == false)
        if isSelected == true {
            lblSort.textColor = .systemPink
        }
        else{
            lblSort.textColor = .gray
            
        }
    }
    
}
