//
//  StyleWrapper+UIView.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    static func roundedStyle(radius: CGFloat = 0.0) -> StyleWrapper {
        return .wrap { view in
            view.layer.cornerRadius = radius < 0.001 ? view.bounds.height / 2 : radius
            view.clipsToBounds = true
        }
    }
    
    static func statusBarStyle(color: UIColor) -> StyleWrapper {
        return .wrap { view in
            let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
            statusBarView.backgroundColor = color
            view.addSubview(statusBarView)
        }
    }

}
