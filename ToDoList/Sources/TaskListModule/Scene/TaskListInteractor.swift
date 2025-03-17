//
//  TaskListInteractor.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import Foundation
final class TaskListInteractor: TaskListBusinessLogic {
    // MARK: - Private fields
    private let presenter: TaskListPresentationLogic & TaskListRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: TaskListPresentationLogic & TaskListRouterLogic) {
        self.presenter = presenter
    }
}
