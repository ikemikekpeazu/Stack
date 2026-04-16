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
                    Text(entry.date, style: .date)
                        .font(.caption)
                    
                    
                    Text(entry.category)
                        .font(.caption2)
                    
                }
            }
            .onDelete(perform: vm.delete)
            .foregroundStyle(.blue)
        }
        .navigationTitle("Your Savings")
    }
}

#Preview {
    SavingsListView()
        .environmentObject(SavingsViewModel())
}

