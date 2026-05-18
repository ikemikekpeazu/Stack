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
        savings.reduce(0) { $0 + $1.amount }
    }
    
    let homeFilters: [DateFilter] = [.today, .week, .month, .year, .total]
    
    @State private var dateFilter: DateFilter = DateFilter.week
    
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
//                                withAnimation(.easeInOut(duration: 0.2)) {
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
}

#Preview {
    HomeView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
