//
//  AtomicDetailPresenter.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

protocol AtomicDetailPresentationLogic {
    func presentAtomicDetailList(response: [AtomicDetailViewModel])
    func presentSegueTo(controller: UIViewController)
}

class AtomicDetailPresenter: AtomicDetailPresentationLogic {
    weak var viewController: AtomicDetailDisplayLogic?

    // MARK: PresentationLogic
    func presentAtomicDetailList(response: [AtomicDetailViewModel]) {
        let items = transform(rootList: response)
        viewController?.displayAtomicDetailList(result: items)
    }

    func presentSegueTo(controller: UIViewController) {
        viewController?.displaySegueTo(viewController: controller)
    }

    // MARK: Transform
    func transform(rootList: [AtomicDetailViewModel]) -> [AtomicDetailListCell.ViewModel] {
        return rootList.compactMap { list in
            AtomicDetailListCell.ViewModel(
                title: list.title,
                detail: list
            )
        }
    }
}
