//
//  Footer.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class Footer: UIView {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Separator {
            static let height: CGFloat = 0.5
        }
        
        enum Title {
            static let defaultText = "0 Tasks"
            static let topOffset: CGFloat = 20
        }
        
        enum Button {
            static let rightOffset: CGFloat = 20
            static let topOffset: CGFloat = 8
            static let size: CGFloat = 36
            static let image: UIImage? = UIImage(
                systemName: "square.and.pencil",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .default)
            )
        }
    }
    
    // MARK: - UI Components
    private let title: UILabel = UILabel()
    private let newTaskButton: UIButton = UIButton(type: .system)
    private let topBorder: UIView = UIView()
    
    // MARK: - Variables
    var newTaskButtonAction: (() -> Void)?
    
    // MARK: - Properties
    var count: Int = 0 {
        didSet {
            title.text = "\(count) Tasks"
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
        backgroundColor = ColorStyle.gray.color
        
        setUpSeparator()
        setUpTitle()
        setUpNewTaskButton()
    }
    
    private func setUpSeparator() {
        topBorder.backgroundColor = ColorStyle.lightGray.color
        
        addSubview(topBorder)
        topBorder.pinTop(to: self)
        topBorder.pinHorizontal(to: self)
        topBorder.setHeight(Constant.Separator.height)
    }
    
    private func setUpTitle() {
        title.text = Constant.Title.defaultText
        title.textColor = ColorStyle.white.color
        title.font = TextStyle.caption.font
        title.textAlignment = .center
        
        addSubview(title)
        title.pinCenterX(to: self)
        title.pinTop(to: self, Constant.Title.topOffset)
    }
    
    private func setUpNewTaskButton() {
        newTaskButton.setImage(Constant.Button.image, for: .normal)
        newTaskButton.tintColor = ColorStyle.yellow.color
        newTaskButton.addTarget(self, action: #selector(newTaskButtonTapped), for: .touchUpInside)
        
        addSubview(newTaskButton)
        newTaskButton.pinRight(to: self, Constant.Button.rightOffset)
        newTaskButton.pinTop(to: self, Constant.Button.topOffset)
        newTaskButton.setHeight(Constant.Button.size)
        newTaskButton.setWidth(Constant.Button.size)
    }
    
    // MARK: - Methods
    @objc
    func newTaskButtonTapped() {
        newTaskButtonAction?()
    }
}
