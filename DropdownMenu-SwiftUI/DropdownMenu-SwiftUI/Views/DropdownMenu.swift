//
//  DropdownMenu.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

struct DropdownMenu: View {
    let title: String?
    let placeholder: String?
    let menuItems: [MenuItem]
    @Binding var selectedItem: MenuItem?
    let provideResetButton: Bool
    
    @State private var expanded = false
    
    init(
        title: String?,
        placeholder: String?,
        menuItems: [MenuItem],
        selectedItem: Binding<MenuItem?>,
        provideResetButton: Bool
    ) {
        self.title = title
        self.placeholder = placeholder
        self.menuItems = menuItems
        self._selectedItem = selectedItem
        self.provideResetButton = provideResetButton
    }
    
    var body: some View {
        VStack(spacing: 8) {
            MenuTitleView(
                title: title,
                selectedItem: $selectedItem,
                provideResetButton: provideResetButton
            )
            
            VStack(spacing: 0) {
                SelectedItemView(
                    expanded: $expanded,
                    selectedItem: $selectedItem,
                    placeholder: placeholder
                )
                
                if expanded {
                    VStack(spacing: 3) {
                        ForEach(menuItems) { item in
                            MenuItemRow(item: item, selectedItem: $selectedItem)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .all)
            .background(Color.bgSecondary)
            .smoothRoundedCorners(expanded ? 16 : 12)
            .shadow(color: Color.black.opacity(0.10), radius: 4, x: 0.0, y: 2.0)
        }
        .onChange(of: selectedItem) { _ in
            guard expanded else { return }
            Self.toggle($expanded)
        }
    }
}

extension DropdownMenu {
    static func toggle(_ state: Binding<Bool>) {
        withAnimation(.DDMSpring()) {
            state.wrappedValue.toggle()
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DropdownMenu(
                title: "Security Question 1",
                placeholder: "Choose a security question",
                menuItems: MenuItem.mockMenuItems,
                selectedItem: .constant(.mockMenuItem),
                provideResetButton: false
            )
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
