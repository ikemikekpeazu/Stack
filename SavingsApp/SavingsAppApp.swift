//
//  SavingsAppApp.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI

@main
struct SavingsAppApp: App {
    @StateObject var vm = SavingsViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(vm)
            
        }
    }
}
