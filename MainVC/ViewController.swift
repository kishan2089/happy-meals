//
//  ViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 18/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class ViewController: baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var viewBottum: UIView!
    @IBOutlet weak var btnGetStarted: UIButton!
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    // hidetabbar on viewwillappear function
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Functions
    func setupUI() {
        btnGetStarted.addCornerRadius(20)
        viewBottum.roundCorners(corners: [.topLeft,.topRight], radius: 20)
    }
    
    //MARK:- Actions
    @IBAction func onBtnGetStarted(_ sender: UIButton) {
        let home = PagerViewVC.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(home, animated: true)
    }
    
}

