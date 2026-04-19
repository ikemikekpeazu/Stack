//
//  SavingsRowView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/18/26.
//

import SwiftUI

struct SavingRowView: View {
    let savingEntity: SavingEntity
    
    var body: some View {
        HStack (spacing: 16) {
//            let category = Category(rawValue: savingEntity.category ?? "") ?? .general
            IconView(savingsEntity: savingEntity)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(savingEntity.title ?? "Untitled")
                    .font(.headline)
                HStack(spacing: 4) {
                    Text(savingEntity.date ?? Date(), format: .dateTime.day().month().year())
                    Text("•")
                    Text(savingEntity.category ?? "General")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            Text("$\(savingEntity.amount, specifier: "%.2f")")
                .font(.system(.body, design: .rounded))
                        .fontWeight(.bold)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        
    }
}

#Preview {
    SavingRowView(savingEntity: SavingEntity.example)
}
