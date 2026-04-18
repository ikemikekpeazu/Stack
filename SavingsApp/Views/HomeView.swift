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
            ZStack {
                
                // Background Layer
                Color(Color.theme.background)
                    .ignoresSafeArea()
                
                // Content Layer
                VStack(spacing: 20) {
                    Text("You Have Saved")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("$\(vm.totalSaved, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("This Week")
                        .font(.title)
                        .fontWeight(.semibold)
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
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .sheet(isPresented: $showAddSheet) {
                    NumberEntryView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(SavingsViewModel())
}
