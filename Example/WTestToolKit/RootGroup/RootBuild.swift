//
//  RootBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

final class RootBuild {
    public init() {}

    public func build() -> UIViewController {
        let presenter = RootPresenter()
        let worker = RootWorker()
        let interactor = RootInteractor(
            presenter: presenter,
            worker: worker
        )
        let controller = RootViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
