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
    }
    
    // MARK: - Private fields
    private let interactor: AddTaskBusinessLogic
    
    //MARK: - UI Components
    
    
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
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ColorStyle.black.color
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = ColorStyle.yellow.color
    }
}
