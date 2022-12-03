//
//  RestorantModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation

class RestorantModel: NSObject {
  
    //MARK:- Property
    var image: String?
    var name: String?
    var rating: String?
    var totalrating: String?
    var typeOfRestro: String?
    var foodType: String?
    
    //Table Property
    init( Image: String,Name:String,Rating:String,TotalRating:String,TypeOfRestro:String,Foodtype:String) {
        self.image = Image
        self.name = Name
        self.rating = Rating
        self.totalrating = TotalRating
        self.typeOfRestro = TypeOfRestro
        self.foodType = Foodtype
    }
    
    //Collection Property
    init( Image: String,Name: String) {
         self.name = Name
         self.image = Image
    }
    
}
