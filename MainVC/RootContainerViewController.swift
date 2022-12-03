//
//  RootContainerViewController.swift
//  MovieApp
//
//  Created by Kartum on 24/02/20.
//  Copyright © 2020 Kartum Infotech. All rights reserved.
//

import UIKit

class RootContainerViewController: UIViewController {
    
    // MARK:- Properties
    var rootViewController: UIViewController?
    
    override var prefersStatusBarHidden : Bool {
        switch rootViewController  {
        case is SplashViewController:
            return false
        case is UINavigationController:
            return false
        default:
            return false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK:- Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutIfNeeded()
        showSplashViewController()
    }
    
    // MARK:- Methods
    private func showSplashViewController() {
        showSplashViewControllerNoPing()
        
        delay(time: 2.0) {
            self.goToApplication()
        }
    }
    
    private func showSplashViewControllerNoPing() {
        
        if rootViewController is SplashViewController {
            return
        }
        
        rootViewController?.willMove(toParent: nil)
        rootViewController?.removeFromParent()
        rootViewController?.view.removeFromSuperview()
        rootViewController?.didMove(toParent: nil)
        
        let splashViewController = SplashViewController.instantiate(fromAppStoryboard: .Main)
        rootViewController = splashViewController
        //splashViewController.pulsing = true
        
        splashViewController.willMove(toParent: self)
        addChild(splashViewController)
        view.addSubview(splashViewController.view)
        splashViewController.didMove(toParent: self)
    }
    
    func goToApplication() {
        guard !(rootViewController is UINavigationController) else { return }
        
        let rootVC = CustomeTabbarController()
        
        rootVC.willMove(toParent: self)
        addChild(rootVC)
        
        if let rootViewController = self.rootViewController {
            self.rootViewController = rootVC
            rootViewController.willMove(toParent: nil)
            
            transition(from: rootViewController, to: rootVC, duration: 0.30, options: [.transitionCrossDissolve, .curveEaseOut], animations: { () -> Void in
                
            }, completion: { _ in
                rootVC.didMove(toParent: self)
                rootViewController.removeFromParent()
                rootViewController.didMove(toParent: nil)
            })
        } else {
            rootViewController = rootVC
            view.addSubview(rootVC.view)
            rootVC.didMove(toParent: self)
        }
    }
}
