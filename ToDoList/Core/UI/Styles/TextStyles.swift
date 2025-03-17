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
    case bodyM // 17pt, Medium
    case bodyS // 16pt, Medium
    case caption // 14pt, Regular
    case tabSmall // 12pt, Regular
}

extension TextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .titleLarge:
            return FontDescription(font: .bold, size: 34)
        case .bodyM:
            return FontDescription(font: .medium, size: 17)
        case .bodyS:
            return FontDescription(font: .medium, size: 16)
        case .caption:
            return FontDescription(font: .regular, size: 14)
        case .tabSmall:
            return FontDescription(font: .regular, size: 12)
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
