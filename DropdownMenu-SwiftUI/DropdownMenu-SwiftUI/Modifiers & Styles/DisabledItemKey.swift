//
//  DisabledItemKey.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-16.
//

import SwiftUI

struct DisabledItemKey: EnvironmentKey {
	static var defaultValue: Bool = false
}

extension EnvironmentValues {
	var showExcludedItemAsDisabled: Bool {
		get { self[DisabledItemKey.self] }
		set { self[DisabledItemKey.self] = newValue }
	}
}

extension View {
	func showExcludedItemsAsDisabled(_ show: Bool = true) -> some View {
		environment(\.showExcludedItemAsDisabled, show)
	}
}
