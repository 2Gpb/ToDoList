//
//  AddTaskInteractor.swift
//  ToDoList
//
//  Created by Peter on 19.03.2025.
//

final class AddTaskInteractor: AddTaskBusinessLogic {
    // MARK: - Private fields
    private let presenter: AddTaskPresentationLogic & AddTaskRouterLogic
    
    // MARK: - Lifecycle
    init(presenter: AddTaskPresentationLogic & AddTaskRouterLogic) {
        self.presenter = presenter
    }
}
