//
//  UINavigationController+setTransparent.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func setTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .clear
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
    
}
