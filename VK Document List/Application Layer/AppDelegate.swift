//
//  AppDelegate.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - UIApplicationDelegate
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setup(application)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.setup(window)
        
        return true
    }
    
    // MARK: - Application configuration
    private func setup(_ application: UIApplication) { }
    
    // MARK: - Window configuration
    private func setup(_ window: UIWindow) {
        let vc = InitialConfigurator.create()
        _ = InitialConfigurator.configure(with: vc)
        
        let nc = BasicNavigationController(rootViewController: vc)
        
        self.window = window
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
    }

}
