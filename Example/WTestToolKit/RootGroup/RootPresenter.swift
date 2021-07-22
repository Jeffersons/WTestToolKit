//
//  RootPresenter.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//

import UIKit

protocol RootPresentationLogic {
    func presentRootList(response: [RootViewModel])
    func presentSegueTo(controller: UIViewController)
}

class RootPresenter: RootPresentationLogic {
    weak var viewController: RootDisplayLogic?

    // MARK: Do PresentationLogic
    func presentRootList(response: [RootViewModel]) {
        let items = transform(rootList: response)
        viewController?.displayRootList(result: items)
    }

    func presentSegueTo(controller: UIViewController) {
        viewController?.displaySegueTo(viewController: controller)
    }

    // MARK: Do Transform
    func transform(rootList: [RootViewModel]) -> [RootListCell.ViewModel] {
        return rootList.compactMap { list in
            RootListCell.ViewModel(
                title: list.type.rawValue,
                type: list.type,
                image: list.type.image ?? UIImage()
            )
        }
    }
}
