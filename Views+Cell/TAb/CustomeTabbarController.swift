//
//  CustomeTabbarController.swift
//  VolumeBoosterV2
//
//  Created by Kartum Infotech on 05/04/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class CustomeTabbarController: UITabBarController {
    
    // MARK: - Properties
    var customTabBarView: CustomeTabbarView!
    var forceHideTabBar = false
    var addBtn = UIButton()
    
    //MARK: - Life Cycle
    init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, WeiTabBar.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class WeiTabBar: UITabBar {
        
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var sizeThatFits = super.sizeThatFits(size)
            sizeThatFits.height = 85
            return sizeThatFits
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        customTabBarView = (Bundle.main.loadNibNamed("CustomeTabbarView", owner: nil, options: nil)!.first as! CustomeTabbarView)
        customTabBarView.delegate = self
        
        let tabBarHeight: CGFloat = 85.0
        
        customTabBarView.frame = CGRect(x: 0.0, y: view.frame.size.height - tabBar.frame.size.height, width: view.frame.size.width, height: tabBarHeight)
        view.addSubview(customTabBarView)
        
        customTabBarView.translatesAutoresizingMaskIntoConstraints = false
        customTabBarView.heightAnchor.constraint(equalToConstant: tabBarHeight).isActive = true
        self.view.leadingAnchor.constraint(equalTo: customTabBarView!.leadingAnchor, constant: 0).isActive = true
        self.view.trailingAnchor.constraint(equalTo: customTabBarView!.trailingAnchor, constant: 0).isActive = true
        self.view.bottomAnchor.constraint(equalTo: customTabBarView!.bottomAnchor, constant: 0).isActive = true
        self.view.layoutIfNeeded()
        
        if forceHideTabBar {
            self.tabBar.isHidden = true
            self.customTabBarView.isHidden = true
        }
        setupViewControllers()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Functions
    private func setupViewControllers() {
        var viewControllers = [AnyObject]()
        
        let navController1: UINavigationController = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "MainIdentity") as! UINavigationController
        let navController2: UINavigationController = AppStoryboard.Offer.instance.instantiateViewController(withIdentifier: "OfferIdentity") as! UINavigationController
        let navController3: UINavigationController = AppStoryboard.Setting.instance.instantiateViewController(withIdentifier: "SettingIdentity") as! UINavigationController
        
        viewControllers = [navController1, navController2,navController3]
        
        self.viewControllers = viewControllers as? [UIViewController]
        
        customTabBarView.selectTabAt(index: 0)
        tabSelecteAtIndex(tabIndex: 0)
    }
    
    func setTabBarHidden(tabBarHidden: Bool, vc: UIViewController?) {
        if tabBarHidden {
            self.tabBar.isHidden = true
            self.customTabBarView.isHidden = tabBarHidden
            addBtn.isHidden = tabBarHidden
            
            vc?.edgesForExtendedLayout = UIRectEdge.bottom
        } else {
            if !forceHideTabBar {
                self.tabBar.isHidden = true
                self.customTabBarView.isHidden = tabBarHidden
                vc?.edgesForExtendedLayout = UIRectEdge.top
            }
        }
    }
    
    // MARK: - Actions
    @objc private func onBtnAdd() {
        customTabBarView.selectTabAt(index: 0)
        tabSelecteAtIndex(tabIndex: 0)
    }
}

// MARK: - CustomTabBarViewDelegate
extension CustomeTabbarController: CustomTabBarViewDelegate {
    
    func tabSelecteAtIndex(tabIndex: Int) {
        let selectedVC = self.viewControllers![tabIndex]
        if tabIndex == 0 {
            addBtn.isSelected = true
        }
        else {
            addBtn.isSelected = false
        }
        selectedIndex = tabIndex
        
        if self.selectedViewController == selectedVC {
            let navVc = self.selectedViewController as! UINavigationController
            navVc.popToRootViewController(animated: false)
        }
        super.selectedViewController = selectedViewController
    }
}

