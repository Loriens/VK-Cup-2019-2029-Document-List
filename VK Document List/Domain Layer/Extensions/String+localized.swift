//
//  String+localized.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
