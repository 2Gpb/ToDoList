//
//  TaskListProtocols.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

protocol TaskListBusinessLogic: UITableViewDataSource {
    func loadTasks()
    func loadAddTask()
}

protocol TaskListPresentationLogic {
    func presentTasks(count: Int)
}

protocol TaskListRouterLogic {
    func routeToTask()
}

protocol TaskListWorker {
    func fetchProducts(completion: ((Result<Item?, any Error>) -> Void)?)
}

protocol TasksStorage {
    var tasks: Tasks { get set }
}
