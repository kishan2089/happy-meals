//
//  collectionBurgerViewController.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 21/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class CollectionBurgerViewController:  baseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var viewReallycool: UIView!
    @IBOutlet weak var collcetionPopular: UICollectionView!
    @IBOutlet weak var tblPopular: UITableView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnAddBasket: UIButton!
    
    //MARK:- Propertys
    var arrHeader = ["Burgers","Snacks"]
    var arrCollImg = ["chizeburger","chizeburger","chizeburger","chizeburger"]
    var arrCollName = ["American Beef","Classic Cheese","Asian Chees","Lazy Cheese"]
    var arrCollPrize = ["$10","$11","$15","$17"]
    
    var viewModel = RestrorantHederViewModel()
    
    //MARK:- LifeCycle
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        setradiuse()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideTabBar()
    }
    
    //MARK:- Fuctions
    func setradiuse () {
        lblTime.addCornerRadius(lblTime.frame.height / 2)
        viewReallycool.addCornerRadius(20)
        btnAddBasket.addCornerRadius(btnAddBasket.frame.height / 2)
        btnSend.addCornerRadius(20)
    }
    
    func setupUI() {
        self.collcetionPopular.register(PopularChoiceCollectionViewCell.nib, forCellWithReuseIdentifier: PopularChoiceCollectionViewCell.identifier)
        self.tblPopular.register(PopularTableViewCell.nib, forCellReuseIdentifier: PopularTableViewCell.identifier)
        self.tblPopular.register(HeaderVeritiseCell.nib, forCellReuseIdentifier: HeaderVeritiseCell.identifier)
        tblPopular.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)     // tableview cell shown
    }
    
    // MARK:- Actions
    @IBAction func onBtnAddcart(_ sender: Any) {
        let nexthome = MyOrderViewController.instantiate(fromAppStoryboard: .Main)
        self.navigationController?.pushViewController(nexthome, animated: true)
    }
}

//MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension CollectionBurgerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCollImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let popularChoice = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularChoiceCollectionViewCell", for: indexPath) as! PopularChoiceCollectionViewCell
        popularChoice.imgBurger.image = UIImage(named: arrCollImg[indexPath.row])
        popularChoice.lblTname.text = arrCollName[indexPath.row]
        popularChoice.lblPizing.text = arrCollPrize[indexPath.row]
        return popularChoice
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 10 - 5 - 5 - 10 ) / 2.5          // collectionView cell height
        let height = width * 1 / 1
        return CGSize(width: floor(width), height: ceil(height))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let nexttPage = BurgerdetailViewController.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(nexttPage, animated: true)
        } else  {
            let nexttPage = BurgerdetailViewController.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(nexttPage, animated: true)
        }
    }
}

//MARK:- UITableViewDelegate, UITableViewDataSource
extension CollectionBurgerViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  viewModel.arrSectionHeading[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nnext = tableView.dequeueReusableCell(withIdentifier: "HeaderVeritiseCell") as! HeaderVeritiseCell
        nnext.lblHeader.text = viewModel.arrSectionHeading[section].rawValue
        return nnext
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return   viewModel.arrBurgers.count
            
        case 1:
            return viewModel.arrSnacks.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as! PopularTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.lblTitle.text = viewModel.arrBurgers[indexPath.row].rawValue
            cell.lblPrizze.text = viewModel.arrBurgers[indexPath.row].cellDetails().prize
            return cell
        case 1:
            cell.lblTitle.text = viewModel.arrSnacks[indexPath.row].rawValue
            cell.lblPrizze.text = viewModel.arrSnacks[indexPath.row].cellDetails().prize
            return cell
            
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
