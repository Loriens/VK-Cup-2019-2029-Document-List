//
//  StyleWrapper+UILabel.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UILabel {
    
    static func cellTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = PTRootUI.regular.font(size: 16.0)
        }
    }
    
    static func cellDescriptionStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = PTRootUI.regular.font(size: 13.0)
            label.textColor = AppTheme.documentDescriptionColor
        }
    }
    
}
