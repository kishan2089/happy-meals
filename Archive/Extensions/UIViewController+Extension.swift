//
//  UIViewController+Extension.swift
//  Trichordal
//
//  Created by Sunil Zalavadiya on 23/01/19.
//  Copyright © 2019 Sunil Zalavadiya. All rights reserved.
//

import UIKit

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class public var storyboardID: String {
        return "\(self)"
    }

    static public func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func showAlertForAppSettings(title: String, message: String, allowCancel: Bool = true, completion: @escaping (Bool) -> ()) {
        let alertController: UIAlertController = UIAlertController(title: NSLocalizedString(title, comment: ""), message: NSLocalizedString(message, comment: ""), preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Settings", comment: ""), style: .default, handler: { (action) -> Void in
            let settingURL = URL(string: UIApplication.openSettingsURLString)!
            
            if(UIApplication.shared.canOpenURL(settingURL)) {
                UIApplication.shared.open(settingURL, options: [:], completionHandler: nil)
            }
            
            completion(true)
            
        }))
        
        if allowCancel {
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { (action) -> Void in
                completion(false)
                
            }))
        }
        
        present(alertController, animated: true, completion: nil)
    }
}
