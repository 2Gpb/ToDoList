//
//  ViewController.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class TaskListViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Title {
            static let text: String = "Задачи"
            static let topOffset: CGFloat = 16
            static let leftOffset: CGFloat = 20
        }
        
        enum Search {
            static let topOffset: CGFloat = 12
            static let leftOffset: CGFloat = 20
        }
    }
    
    // MARK: - Private fields
    private let interactor: TaskListBusinessLogic
    
    //MARK: - UI Components
    private let label: UILabel = UILabel()
    private let search: SearchTextField = SearchTextField()
    
    // MARK: - Lifecycle
    init(interactor: TaskListBusinessLogic) {
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
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ColorStyles.black.color
        
        setUpTitle()
        setUpSearch()
    }
    
    private func setUpTitle() {
        label.text = Constant.Title.text
        label.font = TextStyle.titleLarge.font
        label.textColor = ColorStyles.white.color
        
        view.addSubview(label)
        label.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.Title.topOffset)
        label.pinLeft(to: view, Constant.Title.leftOffset)
    }
    
    private func setUpSearch() {
        search.voiceSearchAction = {
            print(1)
        }
        
        view.addSubview(search)
        search.pinTop(to: label.bottomAnchor, Constant.Search.topOffset)
        search.pinHorizontal(to: view, Constant.Search.leftOffset)
    }
}
