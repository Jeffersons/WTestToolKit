//
//  AtomicDetailInteractor.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol AtomicDetailBusinessLogic {
    func fetchAtoms()
    func fetchMolecules()
    func fetchOrganisms()
    func fetchTemplates()
    func searchComponent(title: String)
    func segueTo(atomicDetail: AtomicDetailViewModel)
}

class AtomicDetailInteractor: AtomicDetailBusinessLogic {
    var presenter: AtomicDetailPresentationLogic
    var worker: AtomicDetailWorker
    var searchText: String?
    var cachedComponents: [AtomicDetailViewModel] = []

    init(presenter: AtomicDetailPresentationLogic, worker: AtomicDetailWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: AtomicDetailBusinessLogic
    func fetchAtoms() {
        let list = worker.fetchAtoms()
        cachedComponents = list
        presenter.presentAtomicDetailList(response: list)
    }

    func fetchMolecules() {
        let list = worker.fetchMolecules()
        cachedComponents = list
        presenter.presentAtomicDetailList(response: list)
    }

    func fetchOrganisms() {
        let list = worker.fetchOrganisms()
        cachedComponents = list
        presenter.presentAtomicDetailList(response: list)
    }
    
    func fetchTemplates() {
        let list = worker.fetchTemplates()
        cachedComponents = list
        presenter.presentAtomicDetailList(response: list)
    }

    func searchComponent(title: String) {
        guard !cachedComponents.isEmpty else {
            return
        }
        
        let components = cachedComponents
        let text = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard text.isEmpty == false else {
            searchText = nil
            presenter.presentAtomicDetailList(response: components)
            return
        }
        searchText = text
        let result = searchInComponents(components, with: text)
        presenter.presentAtomicDetailList(response: result)
    }

    func segueTo(atomicDetail: AtomicDetailViewModel) {
        let controller = UIViewController()
        controller.title = atomicDetail.title
        controller.view = atomicDetail.view
        presenter.presentSegueTo(controller: controller)
    }

    private func searchInComponents(_ components: [AtomicDetailViewModel], with text: String) -> [AtomicDetailViewModel] {
        let text = text.lowercased()
        let predicate = NSPredicate(format: "SELF BEGINSWITH[cd] %@", text)
        let filtered = components.filter {
            let title = $0.title.lowercased()
            let titleParts = title.lowercased().components(separatedBy: .whitespaces)
            return titleParts.contains { predicate.evaluate(with: $0) } || title.hasPrefix(text)
        }
        return filtered
    }
}
