//
//  HomeView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("You have saved")
                Text("$\(vm.totalSaved, specifier: "%.2f")")
                    .font(.largeTitle)
                
                Text("This week: $\(vm.thisWeekTotal, specifier: "%.2f")")
                HStack {
                    Button("Add Savings") {
                        showAddSheet = true
                    }
                    
                    NavigationLink("View Savings") {
                        SavingsListView()
                            .environmentObject(vm)
                    }
                }
                
            }
            .sheet(isPresented: $showAddSheet) {
                AddSavingsView()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(SavingsViewModel())
}
