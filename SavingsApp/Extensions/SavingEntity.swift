//
//  SavingEntity.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/18/26.
//
import SwiftUI
import CoreData

// Mock savings Entity that I can use in my previews

extension SavingEntity {
    static var example: SavingEntity {
        let context = PersistenceController.preview.container.viewContext
        let entity = SavingEntity(context: context)
        entity.id = UUID().uuidString
        entity.title = "Title"
        entity.amount = 25.00
        entity.category = "General"
        entity.date = Date()
        return entity
    }
    
    static var examples: [SavingEntity] {
        let context = PersistenceController.preview.container.viewContext
        let entity1 = SavingEntity(context: context)
        entity1.id = UUID().uuidString
        entity1.title = "Title"
        entity1.amount = 25.0
        entity1.category = "Transportation"
        entity1.date = Date()
        
        let entity2 = SavingEntity(context: context)
        entity2.id = UUID().uuidString
        entity2.title = "Title"
        entity2.amount = 25.0
        entity2.category = "Transportation"
        entity2.date = Date()
        
        let entity3 = SavingEntity(context: context)
        entity3.id = UUID().uuidString
        entity3.title = "Title"
        entity3.amount = 25.0
        entity3.category = "Transportation"
        entity3.date = Date()
        
        let entity4 = SavingEntity(context: context)
        entity4.id = UUID().uuidString
        entity4.title = "Title"
        entity4.amount = 25.0
        entity4.category = "Transportation"
        entity4.date = Date()
        
        
        return [entity1, entity2, entity3, entity4]
        
    }
}
