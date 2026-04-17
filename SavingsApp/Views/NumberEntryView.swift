//
//  Add.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/17/26.
//

import SwiftUI

struct NumberEntryView: View {
    @State private var amount: String = "0"
    @State private var amountEntered: Bool = false
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var date: String = ""
    
    // Grid configuration for the keypad
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "•", "0", "delete.left"]

    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .frame(height: 100)
                Text("Enter Amount: ")
                    .font(.title2)
                    .fontWeight(.semibold)
//                    .padding(.bottom, 5)
                
                // Amount Display
                Text("$\(amount)")
                    .font(.system(size: 80, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                //                    .transition(.scale)
                
                if !amountEntered {
                    keypad
                        .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity).animation(.easeIn(duration: 1)), removal: .move(edge: .top).combined(with: .opacity).animation(.easeIn(duration: 0.07))))
                }
                
                Spacer()
            }
                
                
            nextButton
            VStack {
                HStack{
                    Text("Title")
                    Spacer()
                    TextField("Insert Title", text: $title)
                }
                HStack{
                    Text("Category")
                    TextField("Insert Title", text: $category)
                }
                HStack{
                    Text("Date")
                    TextField("Insert Date", text: $date)
                }
            }
            .offset(y: amountEntered ? -375 : -50)
            .opacity(amountEntered ? 1 : 0)
            .padding(.horizontal)
            
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
            if amount == "0" {
                amount = key
            } else {
                amount += key
            }
        }
    }
}

extension NumberEntryView {
    private var keypad: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(keys, id: \.self) { key in
                Button(action: {
                    handleKeyPress(key)
                }) {
                    if key == "delete.left" {
                        Image(systemName: key)
                            .font(.title)
                    } else {
                        Text(key)
                            .font(.system(size: 30, weight: .medium))
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
    NumberEntryView()
}
