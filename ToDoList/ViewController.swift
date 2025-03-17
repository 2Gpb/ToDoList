//
//  ViewController.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class ViewController: UIViewController {
    private let label = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorStyles.black.color
        label.text = "Задачи"
        label.font = TextStyle.titleLarge.font
        label.textColor = ColorStyles.white.color
        
        view.addSubview(label)
        label.pinCenter(to: view)
    }
}
