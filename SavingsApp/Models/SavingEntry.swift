//
//  SavingEntry.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import Foundation
import SwiftUI

struct SavingEntry: Identifiable {
    let id: String = UUID().uuidString
    var amount: Double
    var date: Date
    var category: String
}
