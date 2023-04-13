//
//  MenuItemRowButtonStyle.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-09.
//

import SwiftUI

struct MenuItemRowButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.background(configurationView(configuration))
	}
	
	@ViewBuilder
	private func configurationView(_ configuration: ButtonStyleConfiguration) -> some View {
		if configuration.isPressed {
			SelectionHighlight(color: .orange)
		}
	}
}
