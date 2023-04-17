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
	
	let showClearButton: Bool
	let scrollToTopOnClear: Bool
	let excludedItems: [MenuItem]
	
	@State private var expanded = false
	
	@Environment(\.showExcludedItemAsDisabled) var showExcluded
	
	// MARK: - Init
	
	/// Creates a dropdown menu with menu items and configurations
	/// - Parameters:
	///   - title: A title that sits above the dropdown menu.
	///   - placeholder: Text that is displayed before a menu item is selected.
	///   - menuItems: The items that are displayed when the dropdown menu is expanded for the user to choose from.
	///   - selectedItem: A binding to the item the user has selected.
	///   - showClearButton: A boolean value indicating whether or not to display a button that clears the current selection.
	///   The default value is `true`.
	///   - scrollToTopOnClear: After the selected item has been removed, the menu item list will be scrolled to the top automatically.
	///   The default value is `true`.
	///   - excludedItems: Any menu item listed as an excluded item will not be visible in the list of items. For example, a selected item
	///   from another dropdown menu can be added as an excluded item if both menus share the same menu items preventing the user from
	///   selecting the same menu item.
	init(
		title: String? = nil,
		placeholder: String? = nil,
		menuItems: [MenuItem],
		selectedItem: Binding<MenuItem?>,
		showClearButton: Bool = true,
		scrollToTopOnClear: Bool = true,
		excludedItems: MenuItem?...
	) {
		self.title = title
		self.placeholder = placeholder
		self.menuItems = menuItems
		self._selectedItem = selectedItem
		self.showClearButton = showClearButton
		self.scrollToTopOnClear = scrollToTopOnClear
		self.excludedItems = excludedItems.compactMap { $0 }
	}
	
	/// Creates a dropdown menu with menu items and configurations
	/// - Parameters:
	///   - title: A title that sits above the dropdown menu.
	///   - placeholder: Text that is displayed before a menu item is selected.
	///   - menuItems: The items that are displayed when the dropdown menu is expanded for the user to choose from.
	///   - selectedItem: A binding to the item the user has selected.
	///   - showClearButton: A boolean value indicating whether or not to display a button that clears the current selection.
	///   The default value is `true`.
	///   - scrollToTopOnClear: After the selected item has been removed, the menu item list will be scrolled to the top automatically.
	///   The default value is `true`.
	init(
		title: String? = nil,
		placeholder: String? = nil,
		menuItems: [MenuItem],
		selectedItem: Binding<MenuItem?>,
		showClearButton: Bool = true,
		scrollToTopOnClear: Bool = true
	) {
		self.title = title
		self.placeholder = placeholder
		self.menuItems = menuItems
		self._selectedItem = selectedItem
		self.showClearButton = showClearButton
		self.scrollToTopOnClear = scrollToTopOnClear
		self.excludedItems = []
	}
	
	// MARK: - Body
	
	var body: some View {
		VStack(spacing: 8) {
			MenuTitleView(
				title: title,
				selectedItem: $selectedItem,
				showClearButton: showClearButton
			)
			
			VStack(spacing: 0) {
				SelectedItemView(
					expanded: $expanded,
					selectedItem: $selectedItem,
					placeholder: placeholder ?? ""
				)
				
				if expanded {
					Divider().transition(.scale(scale: 0.8).combined(with: .opacity))
					
					MenuItemsList(
						menuItems: getValidMenuItems(),
						selectedItem: $selectedItem,
						excludedItems: excludedItems,
						expanded: expanded,
						scrollToTopOnClear: scrollToTopOnClear
					)
				}
			}
			.ignoresSafeArea(.keyboard, edges: .all)
			.background(Color.bgSecondary)
			.smoothRoundedCorners(expanded ? 16 : 12)
			.shadow(color: Color.black.opacity(0.10), radius: 4, x: 0.0, y: 2.0)
		}
		.onChange(of: selectedItem) { _ in
			guard selectedItem != nil else { return }
			Self.toggle($expanded)
		}
	}
	
	// MARK: - Helper Methods
	
	private func getValidMenuItems() -> [MenuItem] {
		guard !showExcluded else { return menuItems }
		
		if excludedItems.isEmpty {
			return menuItems
		} else {
			return menuItems.filter { !excludedItems.contains($0) }
		}
	}
}

// MARK: - Toggle -

extension DropdownMenu {
	static func toggle(_ state: Binding<Bool>) {
		withAnimation(.DDMSpring()) {
			state.wrappedValue.toggle()
		}
	}
}

// MARK: - Previews -

struct DropdownMenu_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			DropdownMenu(
				title: "Security Question 1",
				placeholder: "Choose a security question",
				menuItems: MenuItem.mockMenuItems,
				selectedItem: .constant(.mockMenuItem),
				showClearButton: false
			)
			Spacer()
		}
		.padding(.horizontal, 16)
	}
}

// MARK: - Library -

struct DropdownMenuLibraryContent: LibraryContentProvider {
	@LibraryContentBuilder
	public var views: [LibraryItem] {
		LibraryItem(
			DropdownMenu(
				menuItems: MenuItem.mockMenuItems,
				selectedItem: .constant(nil)
			),
			title: "Dropdown Menu",
			category: .control
		)
	}
}
