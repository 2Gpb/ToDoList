//
//  TaskListCell.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class TaskListCell: UITableViewCell {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Separator {
            static let height: CGFloat = 0.5
            static let horizontalOffset: CGFloat = 20
        }
        
        enum CheckBox {
            static let topOffset: CGFloat = 12
            static let leadingOffset: CGFloat = 20
            static let size: CGFloat = 32
            static let image: UIImage? = UIImage(
                systemName: "checkmark.circle",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .light, scale: .default)
            )
            
            static let blankImage: UIImage? = UIImage(
                systemName: "circle",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .light, scale: .default))
        }
        
        enum Title {
            static let topOffset: CGFloat = 12
            static let leadingOffset: CGFloat = 8
            static let trailingOffset: CGFloat = 20
            static let defaultStrike: Int = 0
        }
        
        enum Description {
            static let topOffset: CGFloat = 8
            static let trailingOffset: CGFloat = 20
            static let numberOfLines: Int = 0
        }
        
        enum Date {
            static let topOffset: CGFloat = 8
            static let trailingOffset: CGFloat = 20
            static let bottomOffset: CGFloat = 12
        }
    }
    
    // MARK: - ReuseId
    static let reuseId = "TaskListCell"
    
    // MARK: - UI Components
    private let separator: UIView = UIView()
    private let checkBoxBlank: UIButton = UIButton(type: .system)
    private let checkBox: UIButton = UIButton(type: .system)
    private let title: UILabel = UILabel()
    private let desc: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    // MARK: - SetUp
    private func setUp() {
        backgroundColor = .clear
        selectionStyle = .none
        
        setUpSeparator()
        setUpCheckBox()
        setUpTitle()
        setUpDescription()
        setUpDate()
    }
    
    private func setUpSeparator() {
        separator.backgroundColor = ColorStyle.lightGray.color
        
        addSubview(separator)
        separator.pinBottom(to: self)
        separator.pinHorizontal(to: self, Constant.Separator.horizontalOffset)
        separator.setHeight(Constant.Separator.height)
    }
    
    private func setUpCheckBox() {
        checkBoxBlank.tintColor = ColorStyle.lightGray.color
        checkBoxBlank.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        checkBoxBlank.setImage(Constant.CheckBox.blankImage, for: .normal)
        
        checkBox.tintColor = ColorStyle.yellow.color
        checkBox.setImage(Constant.CheckBox.image, for: .normal)
        checkBox.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        checkBox.isHidden = true
        
        [checkBox, checkBoxBlank].forEach {
            contentView.addSubview($0)
            $0.pinTop(to: contentView, Constant.CheckBox.topOffset)
            $0.pinLeft(to: contentView, Constant.CheckBox.leadingOffset)
            $0.setHeight(Constant.CheckBox.size)
            $0.setWidth(Constant.CheckBox.size)
        }
    }
    
    private func setUpTitle() {
        title.text = "Заняться спортом"
        title.textColor = ColorStyle.white.color
        title.font = TextStyle.bodyM.font
        
        contentView.addSubview(title)
        title.pinTop(to: contentView, Constant.Title.topOffset)
        title.pinLeft(to: checkBoxBlank.trailingAnchor, Constant.Title.leadingOffset)
        title.pinRight(to: contentView, Constant.Title.trailingOffset)
    }
    
    private func setUpDescription() {
        desc.text = "Сходить в спортзал или сделать тренировку дома. Не забыть про разминку и растяжку!"
        desc.textColor = ColorStyle.white.color
        desc.font = TextStyle.caption.font
        desc.numberOfLines = Constant.Description.numberOfLines
        
        contentView.addSubview(desc)
        desc.pinTop(to: title.bottomAnchor, Constant.Description.topOffset)
        desc.pinLeft(to: title.leadingAnchor)
        desc.pinRight(to: contentView, Constant.Description.trailingOffset)
    }
    
    private func setUpDate() {
        dateLabel.text = "02/10/24"
        dateLabel.textColor = ColorStyle.lightGray.color
        dateLabel.font = TextStyle.caption.font
        
        contentView.addSubview(dateLabel)
        dateLabel.pinTop(to: desc.bottomAnchor, Constant.Date.topOffset)
        dateLabel.pinLeft(to: desc.leadingAnchor)
        dateLabel.pinRight(to: contentView, Constant.Date.trailingOffset)
        dateLabel.pinBottom(to: contentView, Constant.Date.bottomOffset)
    }
    
    // MARK: - Actions
    @objc
    private func checkBoxTapped() {
        let isChecked = checkBoxBlank.isHidden

        checkBox.isHidden = isChecked
        checkBoxBlank.isHidden = !isChecked

        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: !isChecked ? NSUnderlineStyle.single.rawValue : Constant.Title.defaultStrike
        ]

        title.attributedText = NSAttributedString(string: title.text ?? "", attributes: attributes)
        title.textColor = !isChecked ? ColorStyle.lightGray.color : ColorStyle.white.color
        desc.textColor = !isChecked ? ColorStyle.lightGray.color : ColorStyle.white.color
    }
}
