//
//  AddSavingsView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/15/26.
//

//import SwiftUI
//
//struct AddSavingsView: View {
//    @EnvironmentObject var vm: SavingsViewModel
//    @Environment(\.dismiss) var dismiss
//    
//    @State private var amount = ""
//    @State private var category = ""
//    
//    var body: some View {
//        VStack {
//            TextField("Amount", text: $amount)
//                .keyboardType(.decimalPad)
//            
//            TextField("Category", text: $category)
//            
//            Button("Save") {
//                if let value = Double(amount) {
//                    vm.addSaving(amount: value, category: category)
//                    dismiss()
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    AddSavingsView()
//        .environmentObject(SavingsViewModel())
//}
