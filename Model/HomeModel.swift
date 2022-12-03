//
//  HomeViewModel.swift
//  Happy Meals UI
//
//  Created by Kartum Infotech on 25/10/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    var title: String?
    var detail: String?
    var image: String?
    
    init(Title: String, Detail: String, Image: String) {
        self.detail = Detail
        self.title = Title
        self.image = Image
    }
}


