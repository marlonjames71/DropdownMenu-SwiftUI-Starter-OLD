//
//  MenuItemRowButtonStyle.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-09.
//

import SwiftUI

struct MenuItemRowButtonStyle: ButtonStyle {
	@Environment(\.iconTint) var tint: Color
	let tintOverride: Color?
	
	init(tintOverride: Color? = nil) {
		self.tintOverride = tintOverride
	}
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.background(configurationView(configuration))
	}
	
	@ViewBuilder
	private func configurationView(_ configuration: ButtonStyleConfiguration) -> some View {
		if configuration.isPressed {
			SelectionHighlight(color: tintOverride ?? tint)
		}
	}
}
