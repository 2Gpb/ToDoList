//
//  TextStyles.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

enum Font: String {
    case regular = "SFProText-Regular"
    case medium = "SFProText-Medium"
    case bold = "SFProText-Bold"
    
    var name: String {
        return self.rawValue
    }
}

struct FontDescription {
    let font: Font
    let size: CGFloat
}

enum TextStyle {
    case titleLarge // 34pt, Bold
    case taskTitle // 17pt, Medium
    case body // 16pt, Regular
    case caption // 12pt, Regular
    case tabSmall // 11pt, Regular
}

extension TextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .titleLarge:
            return FontDescription(font: .bold, size: 34)
        case .body:
            return FontDescription(font: .regular, size: 16)
        case .taskTitle:
            return FontDescription(font: .medium, size: 17)
        case .caption:
            return FontDescription(font: .regular, size: 12)
        case .tabSmall:
            return FontDescription(font: .regular, size: 11)
        }
    }
}

extension TextStyle {
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont()
        }
        
        return font
    }
}
