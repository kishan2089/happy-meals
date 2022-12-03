//
//  selfDelegateTableCell.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 29/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

//MARK:- SelfDelegateMethods

protocol BurgerCategoryTableViewCellDelegate: AnyObject {
    func burgerCategoryTableViewCellDidSelectViewAll(at index: Int)
    func burgerCategoryTableViewCellDidSelect(at indexPath: IndexPath)
}

class SelfDelegateTableCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var lblTblHeading: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var btnSee: UIButton!
    
    //MARK:- Property
    var imgCollection = ["b1-1","b2-1","b3","b6","b7","burgerr","chinese-1","pastta"]
    
    weak var delegate: BurgerCategoryTableViewCellDelegate?

    //MARK:- LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        collectionview.delegate = self
        collectionview.dataSource = self
        self.collectionview.register(SelfDelegateCollectionCell.nib, forCellWithReuseIdentifier: SelfDelegateCollectionCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK:-UICollectionViewDelegate, UICollectionViewDataSource
extension SelfDelegateTableCell: UICollectionViewDelegate, UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoirescell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelfDelegateCollectionCell", for: indexPath) as! SelfDelegateCollectionCell
        categoirescell.imgCollection.image = UIImage(named: imgCollection[indexPath.row])
        
        return categoirescell
    }
    // SelfDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.burgerCategoryTableViewCellDidSelect(at: indexPath)
        delegate?.burgerCategoryTableViewCellDidSelectViewAll(at: indexPath.row)
    }
}








