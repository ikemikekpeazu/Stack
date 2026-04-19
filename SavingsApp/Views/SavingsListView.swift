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
    
        ZStack {
            // Background Layer
            Color.theme.background.ignoresSafeArea()
            // Content Layer
            List {
                ForEach(vm.savings) { entity in
                    SavingRowView(savingEntity: entity)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                        .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
                        .alignmentGuide(.listRowSeparatorTrailing) { d in d[.trailing] }
                }
                .onDelete(perform: vm.deleteSaving)
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            
            
        }
        
            
        
    }
}

#Preview {
    let previewController = PersistenceController.preview
    
    let previewVM = SavingsViewModel(container: previewController.container)
    return SavingsListView()
        .environmentObject(previewVM)
}

//
//List {
//    ForEach(vm.savings) { entry in
//        VStack(alignment: .leading) {
//            Text("$\(entry.amount, specifier: "%.2f")")
//            Text(entry.date ?? Date(), style: .date)
//                .font(.caption)
//            
//            
//            Text(entry.category ?? "General")
//                .font(.caption2)
//            
//        }
//    }
//    .onDelete(perform: vm.deleteSaving)
//    .foregroundStyle(.blue)
//}
//.navigationTitle("Your Savings")
