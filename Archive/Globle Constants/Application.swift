//
//  Application.swift
//  TaskUp
//
//  Created by Kartum on 27/07/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation
import UIKit


/// Application
struct Application {
    
    /// Placeholder

    
    /// Debug Log enable or not
    static let isDevelopmentMode = true
    static let debug: Bool = true
    
    static let appURL = "https://apps.apple.com/in/app/whatsapp-messenger/id310633997"
    
    static let API_KEY  =   ""
    
    static let GOOGLE_API_KEY   =   ""
    static let googleClientId = ""

    /// Application Mode
    static let mode = Mode.sendbox
    
    /// Application in production or sendbox
    enum Mode {
        case sendbox
        case production
    }
    
    /// App Color
    struct Color {
        static let Color_000040 = UIColor(named: "Color_000040")!
        static let Color_1F245A = UIColor(named: "Color_1F245A")!
        static let Color_ADB0D6 = UIColor(named: "Color_ADB0D6")!
        static let Color_353A77 = UIColor(named: "Color_353A77")!
        
        
        static let Color_FF597F = UIColor(named: "Color_FF597F")!
        static let Color_D52CFF = UIColor(named: "Color_D52CFF")!
        static let Color_15BAFD = UIColor(named: "Color_15BAFD")!
        static let Color_FFAB5B = UIColor(named: "Color_FFAB5B")!
        static let Color_FF00BA = UIColor(named: "Color_FF00BA")!
        static let Color_323663 = UIColor(named: "Color_323663")!
        static let Color_B5B7CE = UIColor(named: "Color_B5B7CE")!
        static let Color_A3A3B1 = UIColor(named: "Color_A3A3B1")!
        static let Color_8080A0 = UIColor(named: "Color_8080A0")!
        static let Color_BABCD4 = UIColor(named: "Color_BABCD4")!
        
        
        static let Color_767BB7 = UIColor(named: "Color_767BB7")!
        static let Color_DFFFD2 = UIColor(named: "Color_DFFFD2")!
        static let Color_43EC00 = UIColor(named: "Color_43EC00")!
        
        //btn disable state colors
        static let Color_B09A14 = UIColor(named: "Color_B09A14")!
        static let Color_A2146F = UIColor(named: "Color_A2146F")!
        static let Color_530CC0 = UIColor(named: "Color_530CC0")!
        static let Color_313032 = UIColor(named: "Color_313032")!
        
        
        static let button_start_7611F6 = UIColor(named: "button_start_7611F6")!
        static let button_center_E71B84 = UIColor(named: "button_center_E71B84")!
        static let button_end_FBDC00 = UIColor(named: "button_end_FBDC00")!
    }
    
    /// App Fonts
    struct Font {
        static let Roboto_Black      =  "Roboto-Black"
        static let Roboto_BlackItalic      =  "Roboto-BlackItalic"
        static let Roboto_Bold  =  "Roboto-Bold"
        static let Roboto_BoldItalic    =  "Roboto-BoldItalic"
        static let Roboto_Italic    =  "Roboto-Italic"
        static let Roboto_Light  =  "Roboto-Light"
        static let Roboto_LightItalic =  "Roboto-LightItalic"
        static let Roboto_Medium  =  "Roboto-Medium"
        static let Roboto_MediumItalic  = "Roboto-MediumItalic"
        static let Roboto_Regular = "Roboto-Regular"
    }
    
    
    struct Device {
        static let version = UIDevice.current.systemVersion
    }
    
//    struct CountryCode {
//        static let code = isDevelopmentMode ? "+65" : "+65"
//    }
}

extension Notification.Name {
    static let refreshContacts    =   Notification.Name("REFRESH_CONTACTS")
    static let refreshContactsinDuplicate  =  Notification.Name("DUPLICATE_REFRESH_CONTACTS")
    static let loginUserStatuseDidChange = Notification.Name("loginUserDidChange")
    static let addShareByMeDoc = Notification.Name("addShareByMeDoc")
    static let loginUserInShare = Notification.Name("loginUserInShare")
    static let updateSearchData = Notification.Name("updateSerachData")
    static let updateModifiteAt = Notification.Name("updateModifiteAt")
    
    
    static let didBecomeActiveNotification = Notification.Name("didBecomeActiveNotification")
    static let redirectToToolsActiveNotification = Notification.Name("redirectToToolsActiveNotification")
//    static let USER_PROFILE_STATUS_CHANGED  =   Notification.Name("USER_PROFILE_STATUS_CHANGED")
}

extension Application {
    /// Firestore
    struct FirestoreTable {
     
    
    }
}
