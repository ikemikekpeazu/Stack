//
//  IconView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 4/18/26.
//

import SwiftUI

struct IconView: View {
    let savingsEntity: SavingEntity
    
    var body: some View {
        let category = Category(rawValue: savingsEntity.category ?? "") ?? .general
        Image(systemName: category.iconName)
            .resizable()
            .foregroundStyle(Color.theme.blue4)
            .scaledToFit()
            .frame(width: 23, height: 23)
            .background(
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(Color.theme.blue1)
            )
        
    }
}

#Preview {
    IconView(savingsEntity: SavingEntity.example)
}
