//
//  TaskListInteractor.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import Foundation
import UIKit

final class TaskListInteractor: NSObject, TaskListBusinessLogic, TasksStorage {
    // MARK: - Private fields
    private let presenter: TaskListPresentationLogic & TaskListRouterLogic
    private let service: TaskListWorker
    
    // MARK: - Variable
    var tasks: Tasks = []

    // MARK: - Lifecycle
    init(presenter: TaskListPresentationLogic & TaskListRouterLogic, service: TaskListWorker) {
        self.presenter = presenter
        self.service = service
    }
    
    // MARK: - Methods
    func loadTasks() {
        service.fetchProducts { [weak self] result in
            switch result {
            case .success(let tasks):
                for i in 0..<(tasks?.todos.count ?? 0) {
                    self?.tasks.append(
                        Task(
                            id: tasks?.todos[i].id ?? 0,
                            completed: tasks?.todos[i].completed ?? false,
                            title: tasks?.todos[i].todo ?? "",
                            description: TaskDesc.tasks[i].description,
                            date: TaskDesc.tasks[i].date
                        )
                    )
                }
                
                self?.presenter.presentTasks(count: self?.tasks.count ?? 0)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension TaskListInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskListCell.reuseId,
            for: indexPath
        ) as? TaskListCell else {
            return UITableViewCell()
        }
        
        cell.configure(
            completed: tasks[indexPath.row].completed,
            title: tasks[indexPath.row].title,
            description: tasks[indexPath.row].description,
            date: tasks[indexPath.row].date
        )
        
        return cell
    }
}
