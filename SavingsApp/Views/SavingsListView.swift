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
    @State var showEditDateSheet = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavingEntity.date, ascending: false)],
        animation: .default
    )
    private var savings: FetchedResults<SavingEntity>
    
//    var totalSaved: Double {
//        savings.reduce(0) { $0 + $1.amount }
//    }
    
    var totalSaved: Double {
        savings
            .filter { isDate(date: $0.date, filter: dateFilter) }
            .reduce(0) { $0 + $1.amount }
    }
    
//    let homeFilters: [DateFilter] = [.today, .week, .month, .year, .total]
    @State private var dateFilter: DateFilter = DateFilter.week
    @State private var categoryFilter: Category = Category.allCategories
    
    @State var searchText: String = ""
    
    var displayTitle: String {
        switch dateFilter {
            
        case .customRange:
            return "\(formattedDate(vm.startDate)) - \(formattedDate(vm.endDate))"
        default:
            return dateFilter.title
            
        }
    }
    
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
                        ForEach(DateFilter.allCases, id: \.self) { filter in
                            Button(filter.title) {
//                                withAnimation() {
//                                    dateFilter = filter
//                                }
                                dateFilter = filter
                                if dateFilter == .customRange {
                                    showEditDateSheet = true
                                }
                                
                            }
                        }
                        
                    } label: {
                        HStack {
                            Text(displayTitle)
//                                .font(.headline)
//                                .fontWeight(.bold)
                                .font(.system(size: 18, weight: .semibold))
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
//                        Text("All Categories")
//                            .font(.system(size: 14, weight: .medium))
                        Menu {
                            ForEach(Category.allCases, id: \.self) { filter in
                                Button(filter.rawValue) {
    //                                withAnimation() {
    //                                    dateFilter = filter
    //                                }
                                    categoryFilter = filter
                                }
                            }
                            
                        } label: {
                            HStack {
                                Text(categoryFilter.rawValue)
    //                                .font(.headline)
    //                                .fontWeight(.bold)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(Color.theme.accent)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(Color.theme.blue4)
                                
                            }
                            .frame(minWidth: 200, alignment: .trailing)
                            
                        }
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
        .sheet(isPresented: $showEditDateSheet) {
            EditDateView()
                .presentationDetents([.height(400)])
        }

        
            
        
    }
    
    func isDate(date: Date?, filter: DateFilter) -> Bool {
        guard let date = date else { return false }
        let calendar = Calendar.current
        let now = Date()
        
        switch filter {
        case .today:
            return calendar.isDateInToday(date)
        case .week:
            return calendar.isDate(date, equalTo: now, toGranularity: .weekOfYear)
        case .month:
            return calendar.isDate(date, equalTo: now, toGranularity: .month)
        case .year:
            return calendar.isDate(date, equalTo: now, toGranularity: .year)
        case .total:
            return true
        case .customRange:
//            return vm.startDate <= date && vm.endDate >= date
            let start = calendar.startOfDay(for: vm.startDate)
            let end = calendar.date(
                bySettingHour: 23,
                minute: 59,
                second: 59,
                of: vm.endDate
            )!
            
            return date >= start && date <= end
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        return formatter.string(from: date)
    }
    
}

#Preview {
    SavingsListView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    
}
