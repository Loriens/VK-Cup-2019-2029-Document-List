//
//  Stylable.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

protocol Stylable { }

extension NSObject: Stylable { }

extension Stylable {
    
    static func style(style: @escaping Style<Self>) -> Style<Self> { return style }
    
    func apply(_ style: StyleWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
}
