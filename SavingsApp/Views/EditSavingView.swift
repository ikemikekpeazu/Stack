//
//  EditSavingView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/18/26.
//

import SwiftUI
import Combine
import CoreData

struct EditSavingView: View {
    @EnvironmentObject var vm: SavingsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var amount: String
    @State private var amountEntered: Bool = true
    @State private var title: String
    @State private var category: Category
    @State private var date: Date
    
    // Grid configuration for the keypad
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "•", "0", "delete.left"]
    let savingEntity: SavingEntity

    init(savingEntity: SavingEntity) {
        self.savingEntity = savingEntity
        let category = Category(rawValue: savingEntity.category ?? "") ?? .general
        _amount = State(initialValue: Self.formattedAmountString(from: savingEntity.amount))
        _title = State(initialValue: savingEntity.title ?? "")
        _category = State(initialValue: category)
        _date = State(initialValue: savingEntity.date ?? Date())
        
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .frame(height: 100)
                Text("Edit:")
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
                        .onChange(of: title) { oldValue, newValue in
                            
                            if newValue.count > vm.titleCharacterLimit {
                                title = String(newValue.prefix(vm.titleCharacterLimit))
                            }
                            
                        }
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
                            if title == "" {
                                title = "Untitled"
                            }
                            vm.updateSaving(entity: savingEntity, amount: value, title: title, category: category, date: date)
                            dismiss()
                        }
                    }
                } label: {
                    ZStack{
                        Text("Confirm")
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
            if !amount.contains(".") {
                
                let components = amount.components(separatedBy: ".")
                let wholeNumberPart = components[0]
                
                if wholeNumberPart.count > 4 {
                    return
                }
                amount += "."
            }
            
        } else {
            let newAmount: String
            
            if amount == "0" {
                newAmount = key
            } else {
                newAmount = amount + key
            }
            
            let components = newAmount.components(separatedBy: ".")
            let wholeNumberPart = components[0]
            
            if wholeNumberPart.count > 4 {
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
    private var isValidAmount: Bool {
        if amount.isEmpty {
            return false
        }
        
        if amount.hasSuffix(".") {
            return false
        }
        return true
    }
    static func formattedAmountString(from value: Double) -> String {
        
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(format: "%.2f", value)
        }
    }
}

extension EditSavingView {
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
                    Text("Edit Amount")
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
            .disabled(!isValidAmount)
            .opacity(isValidAmount ? 1 : 0.5)
        }
        
    }
}



#Preview {
    EditSavingView(savingEntity: SavingEntity.example)
        .environmentObject(SavingsViewModel(context: PersistenceController.preview.container.viewContext))
}
