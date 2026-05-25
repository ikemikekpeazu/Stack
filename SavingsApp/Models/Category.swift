//
//  File.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/18/26.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    
    case allCategories = "All Categories"
    case general = "General"
    case food = "Food"
    case transportation = "Transportation"
    case clothes = "Clothes"
    case fun = "Fun"
    case subscriptions = "Subscriptions"
    case other = "Other"
    
    
    var iconName: String {
        switch self {
        case .general : "tray.full.fill"
        case .food : "fork.knife"
        case .transportation : "car.fill"
        case .clothes : "tshirt.fill"
        case .fun : "ticket.fill"
        case .subscriptions : "repeat"
        case .other : "ellipsis"
        case .allCategories : ""
        }
    }
    
}
