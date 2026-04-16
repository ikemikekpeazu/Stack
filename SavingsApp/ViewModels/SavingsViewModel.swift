//
//  SavingsViewModel.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import Foundation
import SwiftUI
import Combine

class SavingsViewModel: ObservableObject {
    @Published var savings: [SavingEntry] = []
    
    var totalSaved: Double {
        savings.reduce(0) { $0 + $1.amount }
    }
        
    var thisWeekTotal: Double {
        let calendar = Calendar.current
        return savings.filter {
            calendar.isDate($0.date, equalTo: Date(), toGranularity: .weekOfYear)
        }
        .reduce(0) { $0 + $1.amount }
    }
    
    
    func addSaving(amount: Double, category: String) {
        let newEntry = SavingEntry(
            amount: amount,
            date: Date(),
            category: category
        )
        savings.append(newEntry)
    }
    
    func delete(at offsets: IndexSet) {
        savings.remove(atOffsets: offsets)
    }
    
    // Not sure I need this
    func update(entry: SavingEntry) {
        if let index = savings.firstIndex(where: { $0.id == entry.id }) {
            savings[index] = entry
        }
    }
}
