//
//  RestrorantHederViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 26/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//
import UIKit
import Foundation


//MARK:- enum
enum SectionHeading: String {
    case Burgers  = "Burgers"
    case Snacks   = "Snacks"
}

enum Burgers: String {
    case ClassicCheeseBurger = "Classic Cheese Burger"
    case TripleDoubleBurger  = "Triple Double Burger"
    case PorkBurger         = "Pork Burger"
    
    func cellDetails() -> (title:String,prize:String) {
        switch self {
        case .ClassicCheeseBurger:
            return ("Classic Cheese Burger","$16")
        case .TripleDoubleBurger:
            return ("Triple Double Burger","$17")
        case.PorkBurger:
            return ("Pork Burger","$18")
        }
    }
}
    enum Snacks:String {
        case CrispyCkickenWings = "Crispy CkickenWings"
        case TripleDoubleSnack = "Triple Double Snack"
        case PorkSnack = "Pork Snack"
        
        func cellDetails() -> (title:String, prize:String) {
            switch self {
            case .CrispyCkickenWings:
                return ("Crispy CkickenWings","$16")
            case .TripleDoubleSnack:
                return ("Triple Double Snack","$17")
            case.PorkSnack:
                return ("Pork Snack","$18")
            }
        }
    }
   
    class RestrorantHederViewModel: BaseViewModel {
        
        //MARK:- Property
        var arrSectionHeading = [SectionHeading]()
        var arrBurgers = [Burgers]()
        var arrSnacks = [Snacks]()
    
        override init() {
            super.init()
            generateOptionArray()
        }
        
        //MARK:- Function
        func generateOptionArray(){
            arrSectionHeading.removeAll()
            arrSectionHeading.append(.Burgers)
            arrSectionHeading.append(.Snacks)
            
            arrBurgers.removeAll()
            arrBurgers.append(.ClassicCheeseBurger)
            arrBurgers.append(.TripleDoubleBurger)
            arrBurgers.append(.PorkBurger)
            
            arrSnacks.removeAll()
            arrSnacks.append(.CrispyCkickenWings)
            arrSnacks.append(.TripleDoubleSnack)
            arrSnacks.append(.PorkSnack)
        }
        
    }

