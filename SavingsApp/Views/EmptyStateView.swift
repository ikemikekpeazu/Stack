//
//  EmptyStateView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/27/26.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .font(.system(size: 50))
                .foregroundStyle(.gray)
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(Color.theme.accent)
                .multilineTextAlignment(.center)
                .animation(nil, value: title)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(.bottom, 300)
        .padding(.horizontal, 30)
    }
}

#Preview {
    EmptyStateView(imageName: "line.3.horizontal.decrease.circle", title: "No Results", subtitle: "To add a saving, tap the add savings button below")
}
