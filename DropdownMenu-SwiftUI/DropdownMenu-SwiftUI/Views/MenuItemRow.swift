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
	
	@Environment(\.iconTint) var iconTint: Color
	
	// MARK: - Body
	
	var body: some View {
		Button(action: setSelectedItem) {
			HStack(alignment: .firstTextBaseline, spacing: Specs.hStackSpacing) {
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
			.padding(.horizontal, Specs.horizontalPadding)
			.background(background)
			.contentShape(Rectangle())
		}
		.buttonStyle(MenuItemRowButtonStyle())
	}
	
	// MARK: - Helper Methods & Views
	
	private func foregroundColor(normalColor: Color = .primary) -> Color {
		if item == selectedItem {
			return iconTint.isDark ? .white : .black
		} else {
			return normalColor
		}
	}
	
	@ViewBuilder
	private var background: some View {
		if item == selectedItem {
			SelectionHighlight(color: iconTint, style: .normal, padding: true)
		}
	}
	
	private func setSelectedItem() {
		guard selectedItem != item else { return }
		withAnimation(.DDMSpring()) { selectedItem = item }
	}
}

// MARK: - Specs -

extension MenuItemRow {
	enum Specs {
		static let imageWidth: CGFloat = 28
		static let hStackSpacing: CGFloat = 8
		static let horizontalPadding: CGFloat = 16
	}
}

// MARK: - Previews -

struct MenuItemRow_Previews: PreviewProvider {
	static var previews: some View {
		MenuItemRow(item: MenuItem.mockMenuItem, selectedItem: .constant(MenuItem.mockMenuItem))
	}
}
