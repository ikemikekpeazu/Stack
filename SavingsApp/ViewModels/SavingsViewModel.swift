//
//  SavingsViewModel.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class SavingsViewModel: ObservableObject {
    @Published var savings: [SavingEntity] = []
    private let container: NSPersistentContainer
    
    init(container: NSPersistentContainer = PersistenceController.shared.container) {
        self.container = container
        fetchSavings()
    }
    
    func fetchSavings() {
        let request = NSFetchRequest<SavingEntity>(entityName: "SavingEntity")
        
        let sortDescriptor = NSSortDescriptor(keyPath: \SavingEntity.date, ascending: false)
            request.sortDescriptors = [sortDescriptor]
        
        do {
            savings = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching: \(error)")
        }
    }
    
    var totalSaved: Double {
        savings.reduce(0) { $0 + $1.amount }
    }
        
    var thisWeekTotal: Double {
        let calendar = Calendar.current
        let now = Date()
        return savings.filter {
            
            calendar.isDate($0.date ?? now, equalTo: now, toGranularity: .weekOfYear)
        }
        .reduce(0) { $0 + $1.amount }
    }
    
    
    func addSaving(amount: Double, title: String, category: Category, date: Date) {
        let newSaving = SavingEntity(context: container.viewContext)
        newSaving.id = UUID().uuidString
        newSaving.title = title
        newSaving.amount = amount
        newSaving.category = category.rawValue
        newSaving.date = date

        saveData()
    }

    func deleteSaving(at offsets: IndexSet) {
        for index in offsets {
            let entity = savings[index]
            container.viewContext.delete(entity)
        }
        saveData()
    }

    private func saveData() {
        do {
            try container.viewContext.save()
            fetchSavings() 
        } catch {
            print("Error saving: \(error)")
        }
    }
}
