//
//  MyOrderViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation

class MyOrderViewModel {
    
    var dataModel = [MyOrderModel]()
    
    init() {
        genrateArray()
    }
    
    //MARK:- Property
    var titleArray = ["Classic Cheese Burger * 1","American Beef Burger * 1","Sweet Popato Chips * 1","Chicken Wings Burger * 1"]
    var prizearray = ["$16","$11","$12","$12"]
       
    //MARK:- Function
     func genrateArray() {
        dataModel.removeAll()
        dataModel.append(MyOrderModel.init(Title:"Classic Cheese Burger * 1", Prize: "$16"))
        dataModel.append(MyOrderModel.init(Title:"American Beef Burger * 1", Prize: "$11"))
        dataModel.append(MyOrderModel.init(Title:"Sweet Popato Chips * 1", Prize: "$12"))
        dataModel.append(MyOrderModel.init(Title:"Chicken Wings Burger * 1", Prize: "$12"))
    }
    
}
 
