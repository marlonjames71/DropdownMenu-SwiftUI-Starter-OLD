//
//  Animation+.swift
//  DropdownMenu-SwiftUI
//
//  Created by Marlon Raskin on 2023-04-10.
//

import SwiftUI

extension Animation {
    static func DDMSpring() -> Animation {
        spring(
            response: 0.47,
            dampingFraction: 0.83,
            blendDuration: 0
        )
    }
}
