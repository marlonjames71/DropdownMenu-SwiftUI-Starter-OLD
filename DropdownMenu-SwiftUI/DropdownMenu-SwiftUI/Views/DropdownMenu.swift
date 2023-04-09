//
//  DropdownMenu.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

struct DropdownMenu: View {
    let menuItems: [MenuItem]
    
    @State private var selectedItem: MenuItem?
    @State private var expanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if let selectedItem {
                    Text(selectedItem.title)
                } else {
                    Text("Choose an option")
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(expanded ? -180 : 0))
            }
            .padding(.vertical)
            .padding(.horizontal, 16)
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()) { expanded.toggle() }
            }
            
            if expanded {
                VStack(spacing: 3) {
                    ForEach(menuItems) { item in
                        MenuItemRow(item: item, selectedItem: $selectedItem)
                    }
                    .border(.orange)
                }
                .padding(.vertical, 6)
                .border(.red)
            }
        }
        .onChange(of: selectedItem) { newValue in
            withAnimation {
                expanded.toggle()
            }
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(menuItems: MenuItem.mockMenuItems)
    }
}
