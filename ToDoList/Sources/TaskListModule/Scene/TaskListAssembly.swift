//
//  TaskListAssembly.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class TaskListAssembly {
    static func build() -> UIViewController {
        let presenter = TaskListPresenter()
        let interactor = TaskListInteractor(presenter: presenter)
        let view = TaskListViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
