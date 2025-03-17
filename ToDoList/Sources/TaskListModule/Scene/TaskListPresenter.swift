//
//  TaskListPresenter.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//
import UIKit

final class TaskListPresenter: TaskListPresentationLogic {
    // MARK: - Variables
    weak var view: TaskListViewController?
    
    func presentTasks(count: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.displayStart(count: count)
        }
    }
}

// MARK: - RouterLogic
extension TaskListPresenter: TaskListRouterLogic { }
