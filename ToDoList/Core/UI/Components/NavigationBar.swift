//
//  NavigationBar.swift
//  ToDoList
//
//  Created by Peter on 19.03.2025.
//

import UIKit

final class NavigationBar: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum View {
            static let height: CGFloat = 44
        }
        
        enum BackButton {
            static let height: CGFloat = 28
            static let width: CGFloat = 68
            static let title: String = " Back"
            static let imageBounds: CGRect = CGRect(x: 0, y: -4, width: 15, height: 20)
            static let image: UIImage? = UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(weight: .medium)
            )?.withTintColor(ColorStyle.yellow.color, renderingMode: .alwaysOriginal)
        }
        
        enum DoneButton {
            static let height: CGFloat = 28
            static let width: CGFloat = 80
            static let title: String = "Done"
        }
    }
    
    // MARK: - UI Components
    private let backButton = UIButton(type: .system)
    private let doneButton = UIButton(type: .system)
    
    // MARK: - Variables
    var backButtonAction: (() -> Void)?
    var doneButtonAction: (() -> Void)?
    var showDoneButton: Bool = false {
        didSet {
            doneButton.isHidden = !showDoneButton
        }
    }
    
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
        backgroundColor = .clear
        setHeight(Constant.View.height)
        
        setupCustomBackButton()
        setUpDoneButton()
    }
    
    private func setupCustomBackButton() {
        backButton.addTarget(self, action: #selector(backButtonTap), for: .touchUpInside)
        backButton.setAttributedTitle(createBackButtonTitle(), for: .normal)

        addSubview(backButton)
        backButton.pinLeft(to: self)
        backButton.pinCenterY(to: self)
        backButton.setHeight(Constant.BackButton.height)
        backButton.setWidth(Constant.BackButton.width)
    }
    
    private func setUpDoneButton() {
        doneButton.isHidden = true
        doneButton.setTitle(Constant.DoneButton.title, for: .normal)
        doneButton.titleLabel?.font = TextStyle.bodyM.font
        doneButton.tintColor = ColorStyle.yellow.color
        doneButton.addTarget(self, action: #selector(doneButtonTap), for: .touchUpInside)

        addSubview(doneButton)
        doneButton.pinRight(to: self)
        doneButton.pinCenterY(to: self)
        doneButton.setHeight(Constant.DoneButton.height)
        doneButton.setWidth(Constant.DoneButton.width)
    }

    // MARK: - Private methods
    private func createBackButtonTitle() -> NSAttributedString {
        let arrowAttachment = NSTextAttachment()
        arrowAttachment.image = Constant.BackButton.image
        arrowAttachment.bounds = Constant.BackButton.imageBounds

        let arrowString = NSAttributedString(attachment: arrowAttachment)
        let textString = NSAttributedString(string: Constant.BackButton.title, attributes: [
            .foregroundColor: ColorStyle.yellow.color,
            .font: TextStyle.bodyM.font
        ])

        let finalString = NSMutableAttributedString()
        finalString.append(arrowString)
        finalString.append(textString)

        return finalString
    }
    
    // MARK: - Actions
    @objc
    private func backButtonTap() {
        backButtonAction?()
    }
    
    @objc
    private func doneButtonTap() {
        doneButtonAction?()
    }
}
