//
//  Persistence.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    static let preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext

        for i in 0..<5 {
            let newSaving = SavingEntity(context: context)
            newSaving.id = UUID().uuidString
            newSaving.title = "Saving \(i)"
            newSaving.amount = Double(10 * (i + 1))
            newSaving.category = "Food"
            newSaving.date = Date()
        }

        do {
            try context.save()
        } catch {
            fatalError("Failed to save preview data")
        }

        return controller
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "SavingsModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
