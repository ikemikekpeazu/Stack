//
//  Add.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/17/26.
//

import SwiftUI
import Combine
import CoreData

struct AddSavingView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var amount: String = "0"
    @State private var amountEntered: Bool = false
    @State private var title: String = ""
    @State private var category: Category = .general
    @State private var date: Date = Date()
    
    // Grid configuration for the keypad
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "•", "0", "delete.left"]
    


    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(height: 100)
                Text("Enter Amount:")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.theme.accent)
//                    .padding(.bottom, 5)
                
                // Amount Display
                Text("$\(amount)")
                    .font(.system(size: 80, weight: .semibold, design: .rounded))
                    .foregroundStyle(Color.theme.accent)
                //                    .transition(.scale)
                
                if !amountEntered {
                    keypad
                        .transition(.asymmetric(insertion: .move(edge: .top).combined(with: .opacity).animation(.easeIn(duration: 2)), removal: .move(edge: .top).combined(with: .opacity).animation(.easeIn(duration: 0.07))))
                }
                
                Spacer()
            }
                
                
            nextButton
            VStack {
                HStack{
                    Text("Title")
                        .font(.title3)
                        .fontWeight(.semibold)
//                        .frame(width: 85, alignment: .leading)
                    TextField("Insert Title", text: $title, prompt: Text("Insert Title").foregroundStyle(.gray))
                        .font(.title3)
//                        .foregroundStyle(title == "Untitled" ? .gray : .white)
                    
                }
                HStack{
                    Text("Category")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Picker("", selection: $category){
                        ForEach(vm.mainCategories, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    .labelsHidden()
                    .tint(category == .general ? .gray : Color.theme.accent)
                    .padding(.leading, -10)
                    
                    
                    Spacer()
                }
                HStack{
                    Text("Date")
                        .font(.title3)
                        .fontWeight(.semibold)
//                        .frame(width: 85, alignment: .leading)
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .labelsHidden()
                        .tint(Color.theme.blue1)
                    Spacer()
                }
                Button {
                    withAnimation {
                        if let value = Double(amount) {
                            vm.addSaving(amount: value, title: title, category: category, date: date)
                            dismiss()
                        }
                    }
                } label: {
                    ZStack{
                        Text("Add")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.theme.blue4)
                    .foregroundColor(Color.white)
                    .cornerRadius(25)
                    .padding(.top)
                    
                        
                }
            }
            .offset(y: amountEntered ? -275 : -50)
            .opacity(amountEntered ? 1 : 0)
            .padding(.horizontal)
            
            
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
        
    }

    // Handles Key press logic
    private func handleKeyPress(_ key: String) {
        if key == "delete.left" {
            if amount.count > 1 {
                amount.removeLast()
            } else {
                amount = "0"
            }
        } else if key == "•" {
            if !amount.contains(".") { amount += "." }
        } else {
            
            let newAmount: String
            
            if amount == "0" {
                newAmount = key
            } else {
                newAmount = amount + key
            }
            
            let components = newAmount.components(separatedBy: ".")
            let wholeNumberPart = components[0]
            
            if wholeNumberPart.count > 6 {
                return
            }
            
            if components.count > 1 {
                let decimalPart = components[1]
                
                if decimalPart.count > 2 {
                    return
                }
            }
            amount = newAmount
        }
    }
}

extension AddSavingView {
    private var keypad: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(keys, id: \.self) { key in
                Button(action: {
                    handleKeyPress(key)
                }) {
                    if key == "delete.left" {
                        Image(systemName: key)
                            .font(.title)
                            .foregroundStyle(Color.theme.accent)
                    } else {
                        Text(key)
                            .font(.system(size: 30, weight: .medium))
                            .foregroundStyle(Color.theme.accent)
                    }
                }
                .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 40)
    }
    
    private var nextButton: some View {
        VStack {
            Button {
                withAnimation {
                    amountEntered.toggle()
                }
            } label: {
                ZStack{
                    Text("Next")
                        .opacity(!amountEntered ? 1 : 0)
                    Text("Back")
                        .opacity(!amountEntered ? 0 : 1)
                }
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.theme.blue1)
                .foregroundColor(Color.white)
                .cornerRadius(25)
                    
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            .offset(y: amountEntered ? -470 : -170)
        }
        
    }
}



#Preview {
    AddSavingView()
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
}
