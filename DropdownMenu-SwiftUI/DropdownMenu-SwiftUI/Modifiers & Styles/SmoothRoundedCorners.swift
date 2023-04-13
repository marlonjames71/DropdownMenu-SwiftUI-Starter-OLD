//
//  SmoothRoundedCorners.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

/// Clips the view to its bounding frame with the specified corner radius and curve style.
struct CornerRadius: ViewModifier {
	let cornerRadius: CGFloat
	let style: RoundedCornerStyle
	
	init(_ cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous) {
		self.cornerRadius = cornerRadius
		self.style = style
	}
	
	func body(content: Content) -> some View {
		content.clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: style))
	}
}

extension View {
	/// Clips the view to its bounding frame with the specified corner radius. Uses the `continuous` style.
	func smoothRoundedCorners(_ cornerRadius: CGFloat = 10.0) -> some View {
		modifier(CornerRadius(cornerRadius, style: .continuous))
	}
	
	/// Clips the view to its bounding frame with the specified corner radius. Uses the `circular` (default) style.
	func roundedCorners(_ cornerRadius: CGFloat = 10.0) -> some View {
		modifier(CornerRadius(cornerRadius, style: .circular))
	}
}
