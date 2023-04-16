//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
	
	@State private var option1: MenuItem? = nil
	@State private var option2: MenuItem? = nil
	@State private var option3: MenuItem? = nil
	
	let hobbyCategories1: [MenuItem] = [
		.init(title: "Listening to Music", iconName: "headphones"),
		.init(title: "Going to the Movies", iconName: "ticket.fill"),
		.init(title: "Playing Games", iconName: "gamecontroller.fill"),
		.init(title: "Stand-up Comedy", iconName: "music.mic"),
		.init(title: "Photography", iconName: "camera.fill"),
		.init(title: "Reading", iconName: "books.vertical.fill"),
		.init(title: "Cycling", iconName: "bicycle"),
		.init(title: "Traveling", iconName: "tram.fill"),
		.init(title: "Investing", iconName: "bitcoinsign.square.fill")
	]
	
	let hobbyCategories2: [MenuItem] = [
		.init(title: "Listening to Music"),
		.init(title: "Going to the Movies"),
		.init(title: "Playing Games"),
		.init(title: "Stand-up Comedy"),
		.init(title: "Photography"),
		.init(title: "Reading"),
		.init(title: "Cycling"),
		.init(title: "Traveling"),
		.init(title: "Investing"),
	]
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 24) {
					DropdownMenu(
						title: "Favorite Hobby 1",
						placeholder: "Choose an option below",
						menuItems: hobbyCategories1,
						selectedItem: $option1,
						excludedItems: option2, option3//, option1
					)
					.iconTint(.iconBlue)
					
					DropdownMenu(
						title: "Favorite Hobby 2",
						placeholder: "Choose an option below",
						menuItems: hobbyCategories1,
						selectedItem: $option2,
						excludedItems: option1, option3//, option2
					)
					.iconTint(.iconPink)
					
					DropdownMenu(
						title: "Favorite Hobby 3",
						placeholder: "Choose an option below",
						menuItems: hobbyCategories1,
						selectedItem: $option3,
						excludedItems: option1, option2//, option3
					)
					.iconTint(.iconGreen)
					
					Spacer()
				}
				.padding()
				.frame(maxWidth: .infinity)
			}
			.background(Color.bgPrimary.ignoresSafeArea())
			.scrollContentBackground(.visible)
			.scrollBounceBehavior(.basedOnSize)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
