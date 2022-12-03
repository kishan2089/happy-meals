//
//  Storyboard.swift
//  Trichordal
//
//  Created by Kartum Infotech on 15/02/19.
//  Copyright © 2019 Kartum Infotech. All rights reserved.
//

import Foundation
import UIKit

public enum AppStoryboard: String {

    case Main
    case MyWork
    case Tools
    case CollageVideo
    case Slideshow
    case Mirror
    case GifMaker
    case Boomerang
    case VideoFXEditor
    
    public var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    public func viewController<T: UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {

        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID

        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }

    public func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
