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
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyStateView(imageName: "magnifyingglass", title: "No Results", subtitle: "Fix your search")
}
