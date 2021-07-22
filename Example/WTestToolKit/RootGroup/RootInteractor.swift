//
//  RootInteractor.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//

import Foundation

protocol RootBusinessLogic {
    func fetchRootList()
    func segueTo(rootType: RootType)
}

class RootInteractor: RootBusinessLogic {
    var presenter: RootPresentationLogic
    var worker: RootWorker

    init(presenter: RootPresentationLogic, worker: RootWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: Do BusinessLogic
    func fetchRootList() {
        let rootListModel = worker.fetchRootList()
        presenter.presentRootList(response: rootListModel)
    }

    func segueTo(rootType: RootType) {
        let controller = RouterWTestToolKit.atomicDetailViewController(rootType: rootType)
        presenter.presentSegueTo(controller: controller)
    }
}
