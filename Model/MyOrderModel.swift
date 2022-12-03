//
//  MyOrderModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class MyOrderModel: NSObject {

   //MARK:- Property
    var title: String?
    var prie: String?
    
    init (Title:String,Prize:String){
        self.title = Title
        self.prie = Prize
    }
    
}
