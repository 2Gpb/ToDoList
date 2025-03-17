//
//  ToDo.swift
//  ToDoList
//
//  Created by Peter on 18.03.2025.
//

import Foundation

typealias Tasks = [Task]

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

struct Task {
    var id: Int
    var completed: Bool
    var title: String
    var description: String
    var date: String
}

struct TaskDesc {
    static let tasks: [(description: String, date: String)] = [
        ("Do something kind for a loved one, like writing a note or helping out.", "09/10/24"),
        ("Memorize a poem and recite it to improve memory and appreciation for literature.", "09/11/24"),
        ("Watch a classic movie and fully immerse yourself in its story and cinematography.", "09/12/24"),
        ("Watch a documentary on an interesting topic to expand your knowledge.", "09/13/24"),
        ("Research cryptocurrency investments, their risks, and potential benefits.", "09/14/24"),
        ("Contribute to an open-source project—write code, fix bugs, or donate.", "09/15/24"),
        ("Solve a Rubik’s cube or practice improving your solving speed.", "09/16/24"),
        ("Bake pastries and share them with a friend or neighbor.", "09/17/24"),
        ("Go see a Broadway production and enjoy a live performance.", "09/18/24"),
        ("Write a thank-you letter to someone who has influenced your life.", "09/19/24"),
        ("Host a game night with friends and enjoy some fun together.", "09/20/24"),
        ("Play a football scrimmage with friends and stay active.", "09/21/24"),
        ("Send a message to an old friend and reconnect.", "09/22/24"),
        ("Organize your pantry and get rid of expired items.", "09/23/24"),
        ("Buy a small decoration to freshen up your home.", "09/24/24"),
        ("Plan your dream vacation—research destinations and budget.", "09/25/24"),
        ("Deep clean your car inside and out for a fresh look.", "09/26/24"),
        ("Draw and color a Mandala to relax and express creativity.", "09/27/24"),
        ("Create a personal cookbook with your favorite recipes.", "09/28/24"),
        ("Bake a pie with friends and experiment with flavors.", "09/29/24"),
        ("Start a compost pile to reduce waste and enrich soil.", "09/30/24"),
        ("Take a hike in a local park and enjoy nature.", "10/01/24"),
        ("Sign up for a community class and learn something new.", "10/02/24"),
        ("Research a topic you’ve always been curious about.", "10/03/24"),
        ("Plan a trip abroad and create an exciting itinerary.", "10/04/24"),
        ("Practice touch typing to increase your speed and accuracy.", "10/05/24"),
        ("Learn the basics of Express.js for backend development.", "10/06/24"),
        ("Try calligraphy and experiment with different writing styles.", "10/07/24"),
        ("Have a fun photo session with friends and get creative.", "10/08/24"),
        ("Hit the gym and get a good workout in.", "10/09/24")
    ]
}
