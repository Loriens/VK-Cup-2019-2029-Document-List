//
//  UIViewController+identifier.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public class var identifier: String {
        return String.className(self)
    }
    
}
