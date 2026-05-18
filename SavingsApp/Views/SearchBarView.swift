//
//  SearchBarView.swift
//  SavingsApp
//
//  Created by Ikem Ikekpeazu on 5/17/26.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState private var isSearching: Bool
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(.systemGray))
            TextField("", text: $searchText, prompt: Text("Search Title").foregroundStyle(Color(.systemGray)))
                .focused($isSearching)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color(.systemGray))
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            isSearching = false
                        }
                    
                }
                
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemGray5))
        )
        
        
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
