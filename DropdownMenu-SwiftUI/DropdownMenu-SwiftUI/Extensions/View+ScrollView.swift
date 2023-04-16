//
//  View+ScrollView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

extension View {
	/// Embeds the view inside of a `ScrollView` based on a condition
	@ViewBuilder func embedInScrollView(
		_ condition: Bool = true,
		axis: Axis.Set = .vertical,
		showsIndicators: Bool = true
	) -> some View {
		if condition {
			ScrollView(axis, showsIndicators: showsIndicators) { self }
		} else { self }
	}
}
