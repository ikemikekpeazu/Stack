//
//  EditDateView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/23/26.
//

import SwiftUI
import Combine
import CoreData

struct EditDateView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @State var newStartDate: Date
    @State var newEndDate: Date
    @Environment(\.dismiss) var dismiss
    
    var isValidRange: Bool {
        newStartDate <= newEndDate
    }
    
    init() {
        _newStartDate = State(initialValue: Date())
        _newEndDate = State(initialValue: Date())
    }
    
    var body: some View {
        ZStack {
            // Background Layer
            Color.theme.background2.ignoresSafeArea()
            
            // Content Layer
            VStack(spacing: 50) {
                Text("Enter Custom Range:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
                    .padding(.bottom, -20)
                VStack(spacing: 50) {
                    HStack{
                        Text("Start Date")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        DatePicker("", selection: $newStartDate, displayedComponents: [.date])
                            .labelsHidden()
                            .tint(Color.theme.blue1)
                    }
                    HStack{
                        Text("End Date")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        DatePicker("", selection: $newEndDate, displayedComponents: [.date])
                            .labelsHidden()
                            .tint(Color.theme.blue1)
                    }
                }
                .padding(.horizontal)
                
                Button {
                    withAnimation {
                        vm.startDate = newStartDate
                        vm.endDate = newEndDate
                        dismiss()
                    }
                } label: {
                    ZStack{
                        Text("Confirm")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.theme.blue1)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                }
                .disabled(!isValidRange)
                .opacity(isValidRange ? 1 : 0.5)
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
//            .frame(maxWidth: .infinity)
//            .background(Color.white)
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color.theme.accent)
                    .frame(width: 44, height: 44)
                
            }
            .padding()
            
        }
        .onAppear {
            newStartDate = vm.startDate
            newEndDate = vm.endDate
        }
        
    }
}

#Preview {
    EditDateView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
}
