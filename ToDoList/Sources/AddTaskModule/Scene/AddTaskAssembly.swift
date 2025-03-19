//
//  AddTaskAssembly.swift
//  ToDoList
//
//  Created by Peter on 19.03.2025.
//

import UIKit

final class AddTaskAssembly {
    static func build() -> UIViewController {
        let presenter = AddTaskPresenter()
        let interactor = AddTaskInteractor(presenter: presenter)
        let view = AddTaskViewController(interactor: interactor)
        
        presenter.view = view
        return view
    }
}
