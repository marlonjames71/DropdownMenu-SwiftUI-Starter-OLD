//
//  IconTint.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-16.
//

import SwiftUI

struct IconTintKey: EnvironmentKey {
	static var defaultValue: Color = Color.accentColor
}

extension EnvironmentValues {
	var iconTint: Color {
		get { self[IconTintKey.self] }
		set { self[IconTintKey.self] = newValue }
	}
}

extension DropdownMenu {
	func iconTint(_ tint: Color) -> some View {
		environment(\.iconTint, tint)
	}
}