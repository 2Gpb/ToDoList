//
//  UIColor+.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let chars = Array(hex)
        
        let red = Self.charToInt(chars[0]) * 16 + Self.charToInt(chars[1])
        let green = Self.charToInt(chars[2]) * 16 + Self.charToInt(chars[3])
        let blue = Self.charToInt(chars[4]) * 16 + Self.charToInt(chars[5])
        
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    private static func charToInt(_ char: Character) -> Double {
        switch char.uppercased() {
        case "A":
            return 10
        case "B":
            return 11
        case "C":
            return 12
        case "D":
            return 13
        case "E":
            return 14
        case "F":
            return 15
        default:
            guard let result = Double(String(char)) else {
                assertionFailure("could not turn hex")
                return 0
            }
            return result
        }
    }
}
