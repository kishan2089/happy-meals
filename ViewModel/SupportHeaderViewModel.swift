//
//  SupportHeaderViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 27/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation
import UIKit

//MARK:- enum

enum SupportHeading: String {
    case Frequntlyaskedquestions  = "Frequntly asked questions"
    case PaymentMethods   = "Payment Methods "
}

enum Frequntlyaskedquestions: String {
    case MyoderDidnot = "My order didn't delivered"
    case MyorderCome  = "My order came with missingitems"
    case ChangeMyPhone         = "Change my phone number"
    case ChangemyAddress = "Change my delivery address"
    
    
    func cellDetails() -> (String) {
        switch self {
        case .MyoderDidnot:
            return ("My order didn't delivered")
        case .MyorderCome:
            return ("My order came with missingitems")
        case.ChangeMyPhone:
            return ("Change my phone number")
        case.ChangemyAddress:
            return ("Change my delivery address")
        }
    }
}

enum PaymentMethods:String {
    case Howdonotchange = "How don't change payment method"
    case TripleDoubleSnack = "Can payment by Wallet"
    case PaymentFaild = "Payment has been faild"
    
    func cellDetails() -> (String) {
        switch self {
        case .Howdonotchange:
            return ("How don't change payment method")
        case .TripleDoubleSnack:
            return ("Can payment by Wallet")
        case.PaymentFaild:
            return ("Payment has been faild")
        }
    }
}

class SupportHeaderViewModel: BaseViewModel {
    
    //MARK:- Property
    var arrSupportHeading = [SupportHeading]()
    var arrFrequntlyaskedquestions = [Frequntlyaskedquestions]()
    var arrPaymentMethods = [PaymentMethods]()
    
    
    override init() {
        super.init()
        generateOptionArray()
    }
    
    //MARK:- Function
    func generateOptionArray(){
        arrSupportHeading.removeAll()
        arrSupportHeading.append(SupportHeading.Frequntlyaskedquestions)
        arrSupportHeading.append(SupportHeading.PaymentMethods)
        
        arrFrequntlyaskedquestions.removeAll()
        arrFrequntlyaskedquestions.append(.MyoderDidnot)
        arrFrequntlyaskedquestions.append(.MyorderCome)
        arrFrequntlyaskedquestions.append(.ChangeMyPhone)
        arrFrequntlyaskedquestions.append(.ChangemyAddress)
        
        arrPaymentMethods.removeAll()
        arrPaymentMethods.append(.Howdonotchange)
        arrPaymentMethods.append(.TripleDoubleSnack)
        arrPaymentMethods.append(.PaymentFaild)
        
    }
    
}
