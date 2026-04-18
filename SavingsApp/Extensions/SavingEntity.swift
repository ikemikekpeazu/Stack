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
            entity.amount = 25.0
            entity.category = "Transportation"
            entity.date = Date()
            return entity
        }
}
