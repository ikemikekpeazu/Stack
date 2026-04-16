//
//  SavingsListView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI
import Combine

struct SavingsListView: View {
    @EnvironmentObject var vm: SavingsViewModel
    
    var body: some View {
        List {
            ForEach(vm.savings) { entry in
                VStack(alignment: .leading) {
                    Text("$\(entry.amount, specifier: "%.2f")")
                    Text(entry.date ?? Date(), style: .date)
                        .font(.caption)
                    
                    
                    Text(entry.category ?? "General")
                        .font(.caption2)
                    
                }
            }
            .onDelete(perform: vm.deleteSaving)
            .foregroundStyle(.blue)
        }
        .navigationTitle("Your Savings")
    }
}

#Preview {
    SavingsListView()
        .environmentObject(SavingsViewModel())
}

