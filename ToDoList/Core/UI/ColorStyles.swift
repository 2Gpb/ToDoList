//
//  ColorsStyles.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

enum ColorStyles: String, CaseIterable {
    // MARK: - Base Colors
    case black = "040404"
    case white = "F4F4F4"
    case gray = "272729"
    case lightGray = "8D8D8E"
    case yellow = "FED702"
}

extension ColorStyles {
    var color: UIColor {
        UIColor(hex: self.rawValue)
    }
}
