//
//  MenuItem.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import Foundation

struct MenuItem: Identifiable {
    let id: UUID
    let title: String
    let iconName: String?
    
    init(
        id: UUID = UUID(),
        title: String,
        iconName: String? = nil
    ) {
        self.id = id
        self.title = title
        self.iconName = iconName
    }
}

#if DEBUG
extension MenuItem {
    static var mockMenuItems: [Self] {
        [
            .init(title: "What is your favorite place to travel to?", iconName: "airplane"),
            .init(title: "What street did you grow up on?", iconName: "house"),
            .init(title: "What is your favorite book?", iconName: "book")
        ]
    }
}
#endif