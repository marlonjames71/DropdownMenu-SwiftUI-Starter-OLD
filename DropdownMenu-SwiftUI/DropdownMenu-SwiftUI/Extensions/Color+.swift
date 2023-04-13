//
//  Color+.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI
import UIKit

extension Color {
	/// Primary background color for `Dropdown Menu`
	static let bgPrimary = Color("bg-primary")
	/// Secondary background color `Dropdown Menu`
	static let bgSecondary = Color("bg-secondary")
	/// Secondary text color for `Dropdown Menu`
	static let textSecondary = Color("text-secondary")
	/// Pink icon color for `Dropdown Menu`
	static let iconPink = Color("icon-pink")
	/// Blue icon color for `Dropdown Menu`
	static let iconBlue = Color("icon-blue")
	/// Green icon color for `Dropdown Menu`
	static let iconGreen = Color("icon-green")
}


extension Color {
	/// Tells whether a color is considered dark enough to put light colored text on top
	var isDark: Bool {
		var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0
		guard UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: nil) else {
			return false
		}
		
		let lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue
		return lum < 0.5
	}
}
