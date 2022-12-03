//
//  PagerViewVC.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit
import FSPagerView

class PagerViewVC: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var btnFacebooklogin: UIButton!
    
    //MARK:- Property
    private let viewModel = HomeViewModel()
    var count: Int = 0
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Function
    func setupUI() {
        btnCreateAccount.addCornerRadius(btnCreateAccount.frame.height / 2)
        btnFacebooklogin.addCornerRadius(btnFacebooklogin.frame.height / 2)
        pageController.currentPage = count
        pagerSetup()
    }

    func pagerSetup() {
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.isInfinite = true
        self.pageController.numberOfPages = 3
        self.pagerView.register(PagerViewCel.nib, forCellWithReuseIdentifier: PagerViewCel.identifier)
        //        self.pagerView.register(pagercell.nib, forCellWithReuseIdentifier: FSPagerViewCell.identifier)
        pageController.currentPage = count
    }
    
    //MARK:- Actions
    @IBAction func onBtnlogin(_ sender: Any) {
        let nextpage = Loginpage.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nextpage, animated: true)
    }
    
    @IBAction func onBtnCreate(_ sender: Any) {
        let nextpage = CreateAccountViewVC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nextpage, animated: true)
    }
}

//MARK:- FSPagerViewDataSource, FSPagerViewDelegate
extension PagerViewVC: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return viewModel.dataModel.count
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: PagerViewCel.identifier, at: index) as! PagerViewCel
        let data = viewModel.dataModel[index]
        cell.config(Title: data.title! , Detail: data.detail!, Image: data.image!)
        return cell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageController.currentPage = targetIndex
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        self.pageController.currentPage = pagerView.currentIndex
    }
}
