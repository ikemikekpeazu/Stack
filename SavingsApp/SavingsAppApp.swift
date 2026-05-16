//
//  SavingsAppApp.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI
import CoreData

@main
struct SavingsAppApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var vm = SavingsViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
