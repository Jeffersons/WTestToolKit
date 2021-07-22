//
//  RouterWTestToolKit.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
class RouterWTestToolKit: NSObject {
    static func rootViewController() -> UIViewController {
        let viewController: UIViewController = RootBuild()
            .build()
        return viewController
    }

    static func atomicDetailViewController(rootType: RootType) -> UIViewController {
        let viewController: UIViewController = AtomicDetailBuild(groupType: rootType)
            .build()
        return viewController
    }
}
