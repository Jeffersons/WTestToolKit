//
//  AtomicDetailViewController.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol AtomicDetailDisplayLogic: AnyObject {
    func displayAtomicDetailList(result: [AtomicDetailListCell.ViewModel])
    func displaySegueTo(viewController: UIViewController)
}

class AtomicDetailViewController: UIViewController {
    private var searchTask: DispatchWorkItem?
    private var viewModel: [AtomicDetailListCell.ViewModel]?
    let interactor: AtomicDetailBusinessLogic
    let groupType: RootType
    let cellReuseId = "atomicCell"
    lazy var contentView = AtomicDetailListView(frame: UIScreen.main.bounds)
    
    let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.barStyle = .default
        return searchController
    }()
    
    init(interactor: AtomicDetailBusinessLogic, groupType: RootType) {
        self.interactor = interactor
        self.groupType = groupType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        title = groupType.rawValue
        setupTableView()
        showSearchBar()
        fetchGroupType()
    }
    
    func setupTableView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(
            AtomicDetailListCell.self,
            forCellReuseIdentifier: cellReuseId
        )
    }
    
    private func fetchGroupType() {
        switch groupType {
        case .atom:
            interactor.fetchAtoms()
        case .molecule:
            interactor.fetchMolecules()
        case .organism:
            interactor.fetchOrganisms()
        case .template:
            interactor.fetchTemplates()
        }
    }
    
    private func showSearchBar() {
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .automatic
        } else {
            navigationItem.titleView = searchController.searchBar
        }
    }
}

// MARK: TableView DataSource
extension AtomicDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = contentView.tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
            as? AtomicDetailListCell else { return AtomicDetailListCell() }
        
        guard let value = viewModel?[indexPath.row] else {
            return cell
        }
        cell.titleLabel.text = value.detail?.title
        return cell
    }
}

// MARK: TableView Delegate
extension AtomicDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let value = viewModel?[indexPath.row].detail else { return }
        displaySegueTo(viewController:
            AtomicDetailSectionController(
                interactor: interactor,
                viewModel: value
            )
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

// MARK: DisplayLogic
extension AtomicDetailViewController: AtomicDetailDisplayLogic {
    func displayAtomicDetailList(result: [AtomicDetailListCell.ViewModel]) {
        self.viewModel = result
        contentView.tableView.reloadData()
    }
    
    func displaySegueTo(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: UISearchResultsUpdating
extension AtomicDetailViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchTask?.cancel()
        let text = searchController.searchBar.text ?? ""
        let task = DispatchWorkItem { [weak self] in
            self?.interactor.searchComponent(title: text)
        }
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: task)
    }
}
