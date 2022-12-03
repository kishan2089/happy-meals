//
//  RestorantViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation

class RestorantViewModel {
    
    //MARK:- Property
    
    var tblRating = ["4.9","4.2","3.3","5.0"]
    var tblTypeofrestro = ["Cafe","Pestry Shop","Pizza Zone","SteedFood"]
    var tblFoodtype = ["Western Food 1.5","Maxican Food 2.5","Italian Food 3.2","Indian Food 3.2"]
    
    var dataModel = [RestorantModel]()
    var dataModelList = [RestorantModel]()
    
    init () {
        genrateArray()
    }
    
    //MARK:- Function
    func genrateArray() {
        dataModel.removeAll()
        dataModel.append(RestorantModel.init(Image: "giftbox", Name: "Offers"))
        dataModel.append(RestorantModel.init(Image: "chizeburger", Name: "Burgers"))
        dataModel.append(RestorantModel.init(Image: "chinese", Name: "Asian"))
        dataModel.append(RestorantModel.init(Image: "pizzza", Name: "Pizza"))
        
        dataModelList.append(RestorantModel.init(Image: "fastffod", Name: "HollyWood Cafe", Rating: "4.9", TotalRating: "124 rating", TypeOfRestro: "Cafe", Foodtype: "Western Food 1.5"))
        dataModelList.append(RestorantModel.init(Image: "pestryy", Name: "Gita Bekry", Rating: "3.3", TotalRating: "158 rating", TypeOfRestro: "Pestry Shop", Foodtype: "Maxican Food 2.5"))
        dataModelList.append(RestorantModel.init(Image: "pizzzzaa", Name: "Pizza Hut", Rating: "4.2", TotalRating: "232 rating", TypeOfRestro: "Pizza Zone", Foodtype: "Italian Food 3.2"))
        dataModelList.append(RestorantModel.init(Image: "steetfodd", Name: "Rajsthani Food", Rating: "5.0", TotalRating: "194 rating", TypeOfRestro: "SteedFood", Foodtype: "Indian Food 3.2"))
    }
}
