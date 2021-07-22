//
//  AtomicDetailBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

final class AtomicDetailBuild {
    let groupType: RootType

    public init(groupType: RootType) {
        self.groupType = groupType
    }

    public func build() -> UIViewController {
        let presenter = AtomicDetailPresenter()
        let worker = AtomicDetailWorker()
        let interactor = AtomicDetailInteractor(
            presenter: presenter,
            worker: worker
        )
        let controller = AtomicDetailViewController(interactor: interactor, groupType: groupType)
        presenter.viewController = controller
        return controller
    }
}
