//
//  AddButton.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/24/26.
//

import SwiftUI

struct AddButtonView: View {
    @Binding var showAddSheet: Bool
    var body: some View {
        
        Button {
            showAddSheet.toggle()
        } label: {
            HStack {
                Image(systemName: "plus")
                Text("Add Saving")
            }
            .font(.callout)
            .fontWeight(.bold)
    //        .frame(maxWidth: 130)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(Color.theme.blue4)
            .foregroundColor(Color.white)
            .cornerRadius(25)
//            .shadow(color: Color.theme.blue4.opacity(0.5), radius: 6)
        }

        
        
        
    }
}

#Preview {
    AddButtonView(showAddSheet: .constant(false))
}
