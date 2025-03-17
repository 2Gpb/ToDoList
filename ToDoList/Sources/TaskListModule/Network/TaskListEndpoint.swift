//
//  TaskListEndpoint.swift
//  ToDoList
//
//  Created by Peter on 18.03.2025.
//

enum TaskListEndpoint: Endpoint {
    case taskList
    
    var compositePath: String {
        switch self {
            case .taskList:
            return "/todos"
        }
    }
    
    var headers: [String : String] { return [:] }
}
