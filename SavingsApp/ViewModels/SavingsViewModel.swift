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

    @Published var selectedSaving: SavingEntity? = nil
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var homeDateFilter: DateFilter = DateFilter.month
    @Published var listDateFilter: DateFilter = DateFilter.total
    @Published var categoryFilter: Category = Category.allCategories
    @Published var searchText: String = ""
    
    let context: NSManagedObjectContext
    let mainCategories: [Category] = [.general, .food, .transportation, .clothes, .fun, .subscriptions, .other]
    


    
    init(context: NSManagedObjectContext) {
            self.context = context
        }

    func addSaving(amount: Double, title: String, category: Category, date: Date) {
        let newSaving = SavingEntity(context: context)
        newSaving.id = UUID().uuidString
        newSaving.title = title
        newSaving.amount = amount
        newSaving.category = category.rawValue
        newSaving.date = date

        saveData()
    }
    func updateSaving(entity: SavingEntity, amount: Double, title: String, category: Category, date: Date) {
        entity.title = title
        entity.amount = amount
        entity.category = category.rawValue
        entity.date = date

        saveData()
    }

    func deleteSaving(entity: SavingEntity) {
        context.delete(entity)
        saveData()
    }

    private func saveData() {
        do {
            try context.save()
        } catch {
            print("Error saving: \(error)")
        }
    }
}
