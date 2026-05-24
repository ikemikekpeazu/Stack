//
//  DateFilter.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/18/26.
//

import Foundation
import SwiftUI

enum DateFilter: Hashable, CaseIterable {
    case today
    case week
    case month
    case year
    case total
    
    case customRange
    
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


        case .customRange:
            return "Custom Range"
        }
    }
}
