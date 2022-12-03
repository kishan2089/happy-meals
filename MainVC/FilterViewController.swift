//
//  FilterViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 28/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit
import ZMSwiftRangeSlider

class FilterViewController: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblSort: UITableView!
    @IBOutlet weak var btnApplay: UIButton!
    @IBOutlet weak var slider: RangeSlider!
    @IBOutlet weak var collSort: UICollectionView!
    
    //MARK:- Property
    var arrSort = ["Most Popular","Price High to Low","Price Low to High","Nearest to me"]
    var arrCuision = ["All","Fast Food","Japanise","American","Italian","Chainise","Asin","Indian","Greece","Spainish","Thailand"]
    
    private var arrSelectedIndex = [Int]()
    private var isSelectionModeEnabled = true
    
    private var arrSelectedIndex1 = [Int]()
    private var isSelectionModeEnabled1 = true
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUI()
        slider.setValueChangedCallback { (minValue, maxValue) in
            print("rangeSlider1 min value:\(minValue)")
            print("rangeSlider1 max value:\(maxValue)")
        }
        slider.setMinValueDisplayTextGetter { (minValue) -> String? in
            return "$\(minValue)"
        }
        slider.setMaxValueDisplayTextGetter { (maxValue) -> String? in
            return "$\(maxValue)"
        }
        slider.setMinAndMaxRange(0, maxRange: 100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Function
    func SetUI() {
        self.tblSort.register(SortByTableCell.nib, forCellReuseIdentifier: SortByTableCell.identifier)
        self.collSort.register(SortCollectionCell.nib, forCellWithReuseIdentifier: SortCollectionCell.identifier)
        btnApplay.addCornerRadius(btnApplay.frame.height / 2)
        slider.tintColor = .systemPink
    }
    
    //MARK:- Action
    @IBAction func onBtnApply(_ sender: Any) {
        
    }
}

//MARK:- UITableViewDataSource, UITableViewDelegate
extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSort.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nnext = tableView.dequeueReusableCell(withIdentifier: "SortByTableCell", for: indexPath) as! SortByTableCell
        nnext.lblSort.text = arrSort[indexPath.row]
        nnext.setSelected(isSelected: arrSelectedIndex.contains(indexPath.row), isSelectionModeEnabled: isSelectionModeEnabled)
        
        return nnext
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arrSelectedIndex.removeAll()
        arrSelectedIndex.append(indexPath.row)
        tblSort.reloadData()
    }
}

//MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension FilterViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCuision.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nextFilter = collectionView.dequeueReusableCell(withReuseIdentifier: "SortCollectionCell", for: indexPath) as! SortCollectionCell
        nextFilter.lblSortTitle.text = arrCuision[indexPath.row]
        nextFilter.setSelected(isSelected: arrSelectedIndex1.contains(indexPath.row), isSelectionModeEnabled: isSelectionModeEnabled1)
        return  nextFilter
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrSelectedIndex1.removeAll()
        arrSelectedIndex1.append(indexPath.row)
        collSort.reloadData()
    }
}
//colection
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (UIScreen.main.bounds.width - ((5 - 5) * 4 )) / 4
    let height = width * 1.0 / 2.0
    return CGSize(width: floor(width), height: ceil(height))
}


