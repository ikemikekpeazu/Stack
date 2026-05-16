//
//  SavingsListView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI
import Combine
import CoreData

struct SavingsListView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @State var showEditSheet = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavingEntity.date, ascending: false)],
        animation: .default
    )
    private var savings: FetchedResults<SavingEntity>
    
    var body: some View {
    
        ZStack {
            // Background Layer
            Color.theme.background.ignoresSafeArea()
            // Content Layer
            List {
                ForEach(savings) { entity in
                    SavingRowView(savingEntity: entity)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                        .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
                        .alignmentGuide(.listRowSeparatorTrailing) { d in d[.trailing] }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                vm.selectedSaving = entity
                                showEditSheet.toggle()
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            .tint(.orange)
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        let entity = savings[index]
                        vm.deleteSaving(entity: entity)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
        }
        .sheet(isPresented: $showEditSheet) {
            if let selectedSaving = vm.selectedSaving {
                EditSavingView(savingEntity: selectedSaving)
            }
        }
        
            
        
    }
}

#Preview {
    SavingsListView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
}
