//
//  HomeViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation

class HomeViewModel{
    var dataModel = [HomeModel]()
    
     init() {
        generatArray()
    }
    
    //MARK: - Function
    func generatArray() {
        dataModel.removeAll()
        dataModel.append(HomeModel.init(Title: "Find foods you love", Detail: "Discover the best foods from over 1,000 restaurants", Image: "findfood"))
        dataModel.append(HomeModel.init(Title: "Fast Delivery", Detail: "Fast delivery to your home,office and wherever you are", Image: "fastdel"))
        dataModel.append(HomeModel.init(Title: "Live Tracking", Detail: "Real time tracking of your food on the app after order", Image: "livelocation"))
    }
    
}
