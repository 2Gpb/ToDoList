//
//  DTO.swift
//  ToDoList
//
//  Created by Peter on 19.03.2025.
//

// MARK: - Item
struct Item: Codable {
    let todos: [Todo]
}

// MARK: - Todo
struct Todo: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}
