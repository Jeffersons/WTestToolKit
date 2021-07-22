//
//  RootViewController.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol RootDisplayLogic: AnyObject {
    func displayRootList(result: [RootListCell.ViewModel])
    func displaySegueTo(viewController: UIViewController)
}

struct Appearance {
    let cellHeight: CGFloat = 80.0
}

class RootViewController: UIViewController {
    fileprivate let appearance = Appearance()
    private var viewModel: [RootListCell.ViewModel]?
    lazy var contentView = RootListView(frame: UIScreen.main.bounds)
    let interactor: RootBusinessLogic
    let cellReuseId = "rootCell"
    
    init(interactor: RootBusinessLogic) {
        self.interactor = interactor
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
        interactor.fetchRootList()
        setupTableView()
    }
    
    func setupTableView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource =  self
        contentView.tableView.register(RootListCell.self, forCellReuseIdentifier: cellReuseId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

extension RootViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentView.tableView.dequeueReusableCell(withIdentifier: cellReuseId) as? RootListCell else {
            return UITableViewCell()
        }
        guard let value = viewModel?[indexPath.row] else {
            return cell
        }
        cell.titleLabel.text = value.title
        cell.iconImage.image = value.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return appearance.cellHeight
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = viewModel?[indexPath.row]
        guard let result = RootType(rawValue: value?.title ?? "")else {
            return
        }
        self.navigationController?.pushViewController(
            RouterWTestToolKit.atomicDetailViewController(rootType:result),
            animated: true
        )
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}

extension RootViewController: RootDisplayLogic {
    func displayRootList(result: [RootListCell.ViewModel]) {
        self.viewModel = result
        contentView.tableView.reloadData()
    }

    func displaySegueTo(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
