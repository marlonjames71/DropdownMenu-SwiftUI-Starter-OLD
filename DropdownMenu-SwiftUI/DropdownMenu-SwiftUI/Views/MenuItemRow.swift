//
//  MenuItemRow.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-09.
//

import SwiftUI

struct MenuItemRow: View {
    let item: MenuItem
    @Binding var selectedItem: MenuItem?
    
    var body: some View {
        Button {
            guard selectedItem != item else { return }
            selectedItem = item
        } label: {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                if let iconName = item.iconName {
                    Image(systemName: iconName)
                        .font(.body)
                        .foregroundColor(foregroundColor())
                        .frame(width: Specs.imageWidth)
                }
                
                Text(item.title)
                    .foregroundColor(foregroundColor())
                
                Spacer()
            }
            .padding(.vertical)
            .padding(.horizontal, 16)
            .background(background)
            .contentShape(Rectangle())
        }
        .buttonStyle(MenuItemRowButtonStyle())
    }
    
    private func foregroundColor(normalColor: Color = .primary) -> Color {
        item == selectedItem ? .white : normalColor
    }
    
    @ViewBuilder
    private var background: some View {
        if item == selectedItem {
            SelectionHighlight(color: .orange, style: .normal, padding: true)
        }
    }
}

extension MenuItemRow {
    enum Specs {
        static let imageWidth: CGFloat = 28
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(item: MenuItem.mockMenuItem, selectedItem: .constant(MenuItem.mockMenuItem))
    }
}
