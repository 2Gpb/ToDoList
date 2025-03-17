//
//  SearchTextField.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class SearchTextField: UITextField {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum TextField {
            static let radius: CGFloat = 12
            static let placeholder: String = "Поиск"
            static let height: CGFloat = 36
        }
        
        enum RightView {
            static let frame: CGRect = CGRect(x: 0, y: 0, width: 30, height: 20)
            static let rightImage: UIImage? = UIImage(systemName: "microphone.fill")
            static let voiceButtonFrame: CGRect = CGRect(x: 5, y: 0, width: 16, height: 20)
        }
        
        enum LeftView {
            static let frame: CGRect = CGRect(x: 0, y: 0, width: 30, height: 16)
            static let leftImage: UIImage? = UIImage(systemName: "magnifyingglass")
            static let imageOffset: CGRect = CGRect(x: 8, y: 0, width: 18, height: 16)
        }
    }
    
    // MARK: UI Components
    private let voiceSearchTextFieldButton: UIButton = UIButton(type: .system)
    
    // MARK: - Variables
    var voiceSearchAction: (() -> Void)?
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = ColorStyles.gray.color
        textColor = ColorStyles.white.color
        tintColor = ColorStyles.yellow.color
        layer.cornerRadius = Constant.TextField.radius
        font = TextStyle.bodyM.font
        leftView = setUpLeftViewForTextField()
        rightView = setUpRightViewForTextField()
        rightViewMode = .always
        leftViewMode = .always
        attributedPlaceholder = NSAttributedString(
            string: Constant.TextField.placeholder,
            attributes: [
                .foregroundColor: ColorStyles.lightGray.color,
                .font: TextStyle.bodyM.font
            ]
        )
        
        setHeight(Constant.TextField.height)
    }
    
    private func setUpLeftViewForTextField() -> UIView {
        let leftView: UIView = UIView(frame: Constant.LeftView.frame)
        let imageView = UIImageView()
        imageView.image = Constant.LeftView.leftImage
        imageView.tintColor = ColorStyles.lightGray.color
        imageView.frame = Constant.LeftView.imageOffset
        
        leftView.addSubview(imageView)
        return leftView
    }
    
    private func setUpRightViewForTextField() -> UIView {
        let rightView: UIView = UIView(frame: Constant.RightView.frame)
        voiceSearchTextFieldButton.frame = Constant.RightView.voiceButtonFrame
        voiceSearchTextFieldButton.setImage(Constant.RightView.rightImage, for: .normal)
        voiceSearchTextFieldButton.tintColor = ColorStyles.lightGray.color
        voiceSearchTextFieldButton.addTarget(
                self,
                action: #selector(voiceSearch),
                for: .touchUpInside
            )
        
        rightView.addSubview(voiceSearchTextFieldButton)
        return rightView
    }
    
    // MARK: - Actions
    @objc
    private func voiceSearch() {
        voiceSearchAction?()
    }
}
