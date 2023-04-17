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
			HStack(alignment: item.hasSubtext ? .firstTextBaseline : .center, spacing: Specs.hStackSpacing) {
				if let iconName = item.iconName {
					Image(systemName: iconName)
						.font(.body)
						.fontWeight(.light)
						.foregroundColor(iconColor)
						.frame(width: Specs.imageWidth)
				}
				
				VStack(alignment: .leading, spacing: 3) {
					Text(item.title)
						.fontWeight(item.hasSubtext ? .semibold : .regular)
						.foregroundColor(foregroundColor())
					
					if let subtext = item.subtext {
						Text(subtext)
							.foregroundColor(.textSecondary)
							.font(.caption)
					}
				}
				
				Spacer()
			}
			.padding(.vertical, verticalPadding)
			.padding(.horizontal, horizontalPadding)
			.background(background)
			.contentShape(Rectangle())
		}
		.buttonStyle(MenuItemRowButtonStyle(tintOverride: item.tint))
	}
	
	// MARK: - Helper Methods & Views
	
	private var iconColor: Color {
		if let color = item.tint {
			return color
		} else {
			return foregroundColor()
		}
	}
	
	private func foregroundColor(normalColor: Color = .primary) -> Color {
		if item == selectedItem, item.hasSubtext {
			return .primary
		} else if item == selectedItem {
			return iconTint.isDark ? .white : .black
		} else {
			return normalColor
		}
	}
	
	@ViewBuilder
	private var background: some View {
		if item == selectedItem {
			SelectionHighlight(
				color: item.hasSubtext ? .secondary.opacity(0.2) : iconTint,
				style: .normal,
				padding: true
			)
		}
	}
	
	private var verticalPadding: CGFloat {
		item.hasSubtext ? Specs.verticalCompactPadding : Specs.verticalPadding
	}
	
	private var horizontalPadding: CGFloat {
		item.iconName != nil ? Specs.horizontalPaddingIcon : Specs.horizontalPaddingNoIcon
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
		static let hStackSpacing: CGFloat = 4
		static let horizontalPaddingIcon: CGFloat = 12
		static let horizontalPaddingNoIcon: CGFloat = 20
		static let verticalPadding: CGFloat = 16
		static let verticalCompactPadding: CGFloat = 10
	}
}

// MARK: - Previews -

struct MenuItemRow_Previews: PreviewProvider {
	static var previews: some View {
		MenuItemRow(item: MenuItem.mockMenuItem, selectedItem: .constant(MenuItem.mockMenuItem))
	}
}
