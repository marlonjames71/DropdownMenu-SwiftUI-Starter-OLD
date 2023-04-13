//
//  MenuTitleView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-11.
//

import SwiftUI

struct MenuTitleView: View {
    
    let title: String?
    @Binding var selectedItem: MenuItem?
    let provideResetButton: Bool
    
    // MARK: - Body
    
    var body: some View {
        if provideResetButton || title != nil {
            HStack {
                if let title {
                    Text(title)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.leading, 8)
                }
                
                Spacer()
                
                if selectedItem != nil, provideResetButton {
                    clearSelectionButton
                }
            }
        }
    }
    
    // MARK: - Views
    
    private var clearSelectionButton: some View {
        Button(action: clearSelection) {
            Text("Clear")
                .font(.caption)
                .foregroundColor(.primary)
                .padding(.trailing, 8)
        }
    }
    
    // MARK: - Helper Methods

    private func clearSelection() {
        guard selectedItem != nil else { return }
        withAnimation(.DDMSpring()) { selectedItem = nil }
    }
}

// MARK: - Previews -

struct MenuTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTitleView(
            title: nil,
            selectedItem: .constant(.mockMenuItem),
            provideResetButton: true
        )
    }
}
