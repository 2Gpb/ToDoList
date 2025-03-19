//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Peter on 19.03.2025.
//

import UIKit

final class AddTaskViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message = "init(coder:) has not been implemented"
        }
        
        enum Title {
            static let topOffset: CGFloat = 8
            static let horizontalOffset: CGFloat = 20
        }
        
        enum Date {
            static let topOffset: CGFloat = 8
            static let leadingOffset: CGFloat = 20
            static let dateFormat: String = "dd/MM/yy"
        }
        
        enum BodyText {
            static let topOffset: CGFloat = 8
            static let horizontalOffset: CGFloat = 0
            static let containerInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    // MARK: - Private fields
    private let interactor: AddTaskBusinessLogic
    
    //MARK: - UI Components
    private let navBar: NavigationBar = NavigationBar()
    private let titleTextView: UITextView = UITextView()
    private let dateLabel: UILabel = UILabel()
    private let bodyTextView: UITextView = UITextView()
    private weak var activeTextView: UITextView?
    
    // MARK: - Lifecycle
    init(interactor: AddTaskBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleTextView.becomeFirstResponder()
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ColorStyle.black.color
        
        setUpNavigationBar()
        setUpTitle()
        setUpLabel()
        setUpBodyTextView()
    }
    
    private func setUpNavigationBar() {
        navBar.backButtonAction = { [weak self] in
            self?.interactor.goBack()
        }
        
        navBar.doneButtonAction = { [weak self] in
            self?.activeTextView?.resignFirstResponder()
        }
        
        view.addSubview(navBar)
        navBar.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        navBar.pinHorizontal(to: view)
    }
    
    private func setUpTitle() {
        titleTextView.textColor = ColorStyle.white.color
        titleTextView.tintColor = ColorStyle.yellow.color
        titleTextView.backgroundColor = .clear
        titleTextView.keyboardAppearance = .dark
        titleTextView.isScrollEnabled = false
        titleTextView.font = TextStyle.titleLarge.font
        titleTextView.delegate = self
        
        view.addSubview(titleTextView)
        titleTextView.pinTop(to: navBar.bottomAnchor, Constant.Title.topOffset)
        titleTextView.pinHorizontal(to: view, Constant.Title.horizontalOffset)
    }
    
    private func setUpLabel() {
        dateLabel.text = getCurrentDate()
        dateLabel.textColor = ColorStyle.lightGray.color
        dateLabel.font = TextStyle.caption.font
        
        view.addSubview(dateLabel)
        dateLabel.pinTop(to: titleTextView.bottomAnchor, Constant.Date.topOffset)
        dateLabel.pinLeft(to: view, Constant.Date.leadingOffset)
    }
    
    private func setUpBodyTextView() {
        bodyTextView.font = TextStyle.bodyS.font
        bodyTextView.delegate = self
        bodyTextView.textColor = ColorStyle.white.color
        bodyTextView.tintColor = ColorStyle.yellow.color
        bodyTextView.backgroundColor = .clear
        bodyTextView.keyboardAppearance = .dark
        bodyTextView.textContainerInset = Constant.BodyText.containerInsets
        
        view.addSubview(bodyTextView)
        bodyTextView.pinTop(to: dateLabel.bottomAnchor, Constant.BodyText.topOffset)
        bodyTextView.pinHorizontal(to: view, Constant.BodyText.horizontalOffset)
        bodyTextView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: - Private methods
    private func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = Constant.Date.dateFormat
        return formatter.string(from: date)
    }
}

// MARK: - UITextViewDelegate
extension AddTaskViewController: UITextViewDelegate {
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String
    ) -> Bool {
        if textView === titleTextView, text == "\n" {
            bodyTextView.becomeFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        activeTextView = textView
    }
    
    func textViewDidChange(_ textView: UITextView) {
        navBar.showDoneButton = !(bodyTextView.text.isEmpty && titleTextView.text.isEmpty)
    }
}
