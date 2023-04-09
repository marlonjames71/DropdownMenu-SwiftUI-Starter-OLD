//
//  ContentView.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            DropdownMenu(menuItems: MenuItem.mockMenuItems)
            
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
