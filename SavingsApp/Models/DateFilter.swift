//
//  DateFilter.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/18/26.
//

import Foundation
import SwiftUI

enum DateFilter: Hashable {
    case today
    case week
    case month
    case year
    case total
    
    case specificMonth(Date)
    case specificYear(Int)
    
    case customRange(start: Date, end: Date)
    
    var title: String {
        switch self {
        case .today:
            return "Today"

        case .week:
            return "This Week"

        case .month:
            return "This Month"

        case .year:
            return "This Year"
            
        case .total:
            return "Total"

        case .specificMonth(let date):
            return date.formatted(.dateTime.month(.wide).year())

        case .specificYear(let year):
            return "\(year)"

        case .customRange:
            return "Custom Range"
        }
    }
}
