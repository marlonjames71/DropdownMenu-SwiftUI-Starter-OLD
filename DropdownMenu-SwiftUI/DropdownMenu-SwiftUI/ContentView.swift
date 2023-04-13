//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
    
    @State private var option1: MenuItem?
    
    var body: some View {
        VStack(alignment: .leading) {
            DropdownMenu(
                title: "Security Question 1",
                placeholder: "Choose a security question",
                menuItems: MenuItem.mockMenuItems,
                selectedItem: $option1,
                provideResetButton: true
            )
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.bgPrimary.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
