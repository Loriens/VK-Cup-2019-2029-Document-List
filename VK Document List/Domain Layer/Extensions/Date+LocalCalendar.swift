//
//  Date+LocalCalendar.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

extension Date {
    
    public func toLocalDateString() -> String {
        let date = self
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale.current
        
        // Return Example: 1 January 1999
        return formatter.string(from: date)
    }
    
}
