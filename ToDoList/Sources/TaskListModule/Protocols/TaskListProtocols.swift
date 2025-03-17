//
//  TaskListProtocols.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

protocol TaskListBusinessLogic: UITableViewDataSource {
    func loadTasks()
}

protocol TaskListPresentationLogic {
    func presentTasks(count: Int)
    
}

protocol TaskListRouterLogic {
    
}

protocol TaskListWorker {
    func fetchProducts(completion: ((Result<Item?, any Error>) -> Void)?)
}

protocol TasksStorage {
    var tasks: Tasks { get set }
}
