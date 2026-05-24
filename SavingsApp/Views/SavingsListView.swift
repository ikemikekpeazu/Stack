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
//    @State var showEditSheet = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavingEntity.date, ascending: false)],
        animation: .default
    )
    private var savings: FetchedResults<SavingEntity>
    
    var totalSaved: Double {
        savings.reduce(0) { $0 + $1.amount }
    }
    
    let homeFilters: [DateFilter] = [.today, .week, .month, .year, .total]
    @State private var dateFilter: DateFilter = DateFilter.week
    
    @State var searchText: String = ""
    
    var body: some View {
    
        ZStack {
            // Background Layer
            Color.theme.blue1.ignoresSafeArea()
            // Content Layer
            
            VStack {
                HStack {
                    Text("$\(totalSaved, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                    Spacer()
//                    Text("This Month")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .foregroundStyle(Color.white)
                    Menu {
                        ForEach(homeFilters, id: \.self) { filter in
                            Button(filter.title) {
//                                withAnimation() {
//                                    dateFilter = filter
//                                }
                                dateFilter = filter
                                
                            }
                        }
                        
                    } label: {
                        HStack {
                            Text(dateFilter.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                            Image(systemName: "chevron.down")
                                .foregroundStyle(Color.theme.blue4)
                        }
                        .frame(minWidth: 200, alignment: .trailing)
                        
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 30)
                .background(Color.theme.blue1)
                
                VStack {
                    HStack {
                        Text("Savings")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Sort")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .cornerRadius(50)
                    SearchBarView(searchText: $searchText)
                        .padding(.horizontal, 10)
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
                .background(Color.theme.background2)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 20,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 20
                    )
                )
                .ignoresSafeArea()
            }
        }
        .sheet(item: $vm.selectedSaving) { saving in
            EditSavingView(savingEntity: saving)
        }

        
            
        
    }
}

#Preview {
    SavingsListView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    
}
