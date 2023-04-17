//
//  MenuItemsList.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-16.
//

import SwiftUI

struct MenuItemsList: View {
	
	let menuItems: [MenuItem]
	@Binding var selectedItem: MenuItem?
	let excludedItems: [MenuItem]
	let expanded: Bool
	let scrollToTopOnClear: Bool	
	
	@Environment(\.showExcludedItemAsDisabled) var showExcluded
	
	// MARK: - Body
	
	var body: some View {
		if menuItems.isEmpty {
			Text("No other options available")
				.font(.caption)
				.foregroundColor(.textSecondary)
				.padding(.vertical, 6)
		} else {
			ScrollViewReader { proxy in
				VStack(spacing: 3) {
					ForEach(menuItems) { item in
						MenuItemRow(item: item, selectedItem: $selectedItem)
							.tag(item.id)
							.opacity(opacity(item: item))
							.disabled(shouldDisable(item: item))
					}
					.onAppear {
						proxy.scrollTo(selectedItem?.id ?? .init())
					}
				}
				.padding(.vertical, 6)
				.embedInScrollView(shouldEmbed)
				.frame(maxHeight: maxHeight)
				.onChange(of: selectedItem) {
					guard expanded, scrollToTopOnClear, $0 == nil else { return }
					if let first = menuItems.first {
						withAnimation { proxy.scrollTo(first.id) }
					}
				}
			}
		}
	}
	
	// MARK: - Helpers
	
	private var maxHeight: CGFloat? { menuItems.count < 5 ? nil : 310 }
	private var shouldEmbed: Bool { menuItems.count > 4 }
	
	private func shouldDisable(item: MenuItem) -> Bool {
		guard showExcluded else { return false }
		return excludedItems.contains(item) && item != selectedItem
	}
	
	private func opacity(item: MenuItem) -> Double {
		shouldDisable(item: item) ? 0.3 : 1
	}
}

// MARK: - Previews -

struct MenuItemsList_Previews: PreviewProvider {
	static var previews: some View {
		MenuItemsList(
			menuItems: MenuItem.mockMenuItems,
			selectedItem: .constant(.mockMenuItem),
			excludedItems: [],
			expanded: true,
			scrollToTopOnClear: true
		)
	}
}
