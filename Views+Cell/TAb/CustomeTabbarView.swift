//
//  CustomeTabbarView.swift
//  VolumeBoosterV2
//
//  Created by Kartum Infotech on 05/04/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

protocol CustomTabBarViewDelegate: AnyObject {
    func tabSelecteAtIndex(tabIndex: Int)
}

class CustomeTabbarView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet var btnTabs: [UIButton]!
    @IBOutlet var viewContainer: UIView!
    
    //MARK: - Properties
    public var lastIndex = 0
    weak var delegate: CustomTabBarViewDelegate?
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Fuctions
    private func setupUI() {
        viewContainer.addShadow(color: UIColor.black, opacity: 0.5, offset: CGSize(width: 4, height: 10), radius: 15)
    }
    
    func selectTabAt(index: Int) {
        lastIndex = index
        for btn in btnTabs {
            if btn.tag == index {
                btn.isSelected = true
            } else {
                btn.isSelected = false
            }
        }

        delegate?.tabSelecteAtIndex(tabIndex: lastIndex)
    }
    
    // MARK: - IBActions
    @IBAction private func onBtnTabs(_ sender: UIButton) {
        lastIndex = sender.tag
        selectTabAt(index: lastIndex)
    }
}

