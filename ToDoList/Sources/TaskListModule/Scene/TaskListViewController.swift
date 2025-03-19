//
//  ViewController.swift
//  ToDoList
//
//  Created by Peter on 17.03.2025.
//

import UIKit

final class TaskListViewController: UIViewController {
    // MARK: - Constants
    private enum Constant {
        enum Error {
            static let message: String = "init(coder:) has not been implemented"
        }
        
        enum Title {
            static let text: String = "Tasks"
            static let topOffset: CGFloat = 16
            static let leftOffset: CGFloat = 20
        }
        
        enum Search {
            static let topOffset: CGFloat = 12
            static let leftOffset: CGFloat = 20
        }
        
        enum Footer {
            static let heightMultiplier: CGFloat = 0.1
        }
        
        enum Table {
            static let separatorInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            static let topOffset: CGFloat = 20
            static let bottomOffset: CGFloat = -0.5
        }
        
        enum ContextMenu {
            static let editTitle: String = "Edit"
            static let shareTitle: String = "Share"
            static let deleteTitle: String = "Delete"
            static let editImage: UIImage? = UIImage(systemName: "square.and.pencil")
            static let shareImage: UIImage? = UIImage(systemName: "square.and.arrow.up")
            static let deleteImage: UIImage? = UIImage(systemName: "trash")
        }
    }
    
    // MARK: - Private fields
    private let interactor: TaskListBusinessLogic & TasksStorage
    
    //MARK: - UI Components
    private let label: UILabel = UILabel()
    private let search: SearchTextField = SearchTextField()
    private let footer: Footer = Footer()
    private let taskTable: UITableView = UITableView()
    
    // MARK: - Lifecycle
    init(interactor: TaskListBusinessLogic & TasksStorage) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constant.Error.message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        interactor.loadTasks()
    }
    
    // MARK: - Methods
    func displayStart(count: Int) {
        taskTable.reloadData()
        footer.count = count
    }
    
    // MARK: - SetUp
    private func setUp() {
        view.backgroundColor = ColorStyle.black.color
        navigationController?.navigationBar.isHidden = true
        
        setUpTitle()
        setUpSearch()
        setUpFooter()
        setUpTable()
    }
    
    private func setUpTitle() {
        label.text = Constant.Title.text
        label.font = TextStyle.titleLarge.font
        label.textColor = ColorStyle.white.color
        
        view.addSubview(label)
        label.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constant.Title.topOffset)
        label.pinLeft(to: view, Constant.Title.leftOffset)
    }
    
    private func setUpSearch() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openSearch))
        search.addGestureRecognizer(gestureRecognizer)
        search.voiceSearchAction = {
            print(1)
        }
        
        view.addSubview(search)
        search.pinTop(to: label.bottomAnchor, Constant.Search.topOffset)
        search.pinHorizontal(to: view, Constant.Search.leftOffset)
    }
    
    private func setUpFooter() {
        footer.newTaskButtonAction = { [weak self] in
            self?.interactor.loadAddTask()
        }
        
        view.addSubview(footer)
        footer.pinBottom(to: view)
        footer.pinHorizontal(to: view)
        footer.setHeight(view.frame.height * Constant.Footer.heightMultiplier)
    }
    
    private func setUpTable() {
        taskTable.dataSource = interactor
        taskTable.delegate = self
        taskTable.backgroundColor = .clear
        taskTable.showsVerticalScrollIndicator = false
        taskTable.rowHeight = UITableView.automaticDimension
        taskTable.separatorInset = Constant.Table.separatorInset
        taskTable.separatorColor = ColorStyle.lightGray.color
        taskTable.register(TaskListCell.self, forCellReuseIdentifier: TaskListCell.reuseId)
        
        view.addSubview(taskTable)
        taskTable.pinTop(to: search.bottomAnchor, Constant.Table.topOffset)
        taskTable.pinHorizontal(to: view)
        taskTable.pinBottom(to: footer.topAnchor, Constant.Table.bottomOffset)
    }
    
    // MARK: Actions
    @objc
    private func openSearch() {
        search.becomeFirstResponder()
    }
}

// MARK: - UITableViewDelegate
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.loadAddTask()
    }
    
    func tableView(
        _ tableView: UITableView,
        contextMenuConfigurationForRowAt indexPath: IndexPath,
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        let menu = UIContextMenuConfiguration(
            identifier: nil,
            previewProvider: nil
        ) { _ in
            
            let editAction = UIAction(
                title: Constant.ContextMenu.editTitle,
                image: Constant.ContextMenu.editImage
            ) { _ in
                print(12)
            }
            
            let shareAction = UIAction(
                title: Constant.ContextMenu.shareTitle,
                image: Constant.ContextMenu.shareImage
            ) { _ in
                print(11)
            }
            
            let deleteAction = UIAction(
                title: Constant.ContextMenu.deleteTitle,
                image: Constant.ContextMenu.deleteImage
            ) { _ in
                print(13)
            }
            
            deleteAction.attributes = [.destructive]
            
            return UIMenu(children: [editAction, shareAction, deleteAction])
        }
        
        return menu
    }
}
