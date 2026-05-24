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
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Background Layer
            Color.theme.background2.ignoresSafeArea()
            
            // Content Layer
            VStack(spacing: 50) {
                Text("Enter Custom Range: ")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
                    .padding(.bottom, -20)
                HStack{
                    Text("Start Date")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    DatePicker("", selection: $startDate, displayedComponents: [.date])
                        .labelsHidden()
                        .tint(Color.theme.blue1)
                }
                HStack{
                    Text("End Date")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    DatePicker("", selection: $endDate, displayedComponents: [.date])
                        .labelsHidden()
                        .tint(Color.theme.blue1)
                }
                Button {
                    withAnimation {
                        vm.startDate = startDate
                        vm.endDate = endDate
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
                
                .padding(.bottom, 20)
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    EditDateView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
}
