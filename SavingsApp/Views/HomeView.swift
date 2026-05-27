//
//  HomeView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

import SwiftUI
import Combine
import CoreData

struct HomeView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @State private var showAddSheet = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SavingEntity.date, ascending: false)]
    ) private var savings: FetchedResults<SavingEntity>
    
    var totalSaved: Double {
        savings
            .filter { isDate(date: $0.date, filter: vm.homeDateFilter) }
            .reduce(0) { $0 + $1.amount }
    }
    
    let homeFilters: [DateFilter] = [.today, .week, .month, .year, .allTime]
    
//    @State private var dateFilter: DateFilter = DateFilter.week
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Background Layer
//                Color(Color.theme.background)
                Color.theme.background
                    .ignoresSafeArea()
                
                // Content Layer
                VStack(spacing: 20) {
                    Text("You Have Saved")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.theme.accent)
                    Text("$\(totalSaved, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.theme.accent)
                    
                    
                    Menu {
                        ForEach(homeFilters, id: \.self) { filter in
                            Button(filter.title) {
//                                withAnimation() {
//                                    dateFilter = filter
//                                }
                                vm.homeDateFilter = filter
                                
                            }
                        }
                        
                    } label: {
                        HStack {
                            Text(vm.homeDateFilter.title)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.theme.accent)
                            Image(systemName: "chevron.down")
                        }
                        .frame(minWidth: 300)
                        
                    }
                    .padding(.bottom, 100)
                    
                    HStack {
                        Button {
                            showAddSheet = true
                        } label: {
                            Text("Add Savings")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .frame(width: 180, height: 50)
                                .background(Color.theme.blue1)
                                .cornerRadius(30)
                                .padding(.leading, 10)
                        }
                        Spacer()
                        NavigationLink {
                            SavingsListView()
                        } label: {
                            Text("View Savings")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .frame(width: 180, height: 50)
                                .background(Color.theme.blue4)
                                .cornerRadius(30)
                                .padding(.trailing, 10)
                        }
                    }
                }
//                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .sheet(isPresented: $showAddSheet) {
                    AddSavingView()
                }
            }
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
        case .allTime:
            return true
        default:
            return true
        }
    }
    
}

#Preview {
    HomeView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
