//
//  Configurable.swift
//  WTestToolKit
//
//  Created by Jefferson Batista on 21/07/21..
//

import Foundation

public protocol UnsafeConfigurable {
    func config(with viewModel: Any)
}

public protocol Configurable: UnsafeConfigurable {
    associatedtype ViewModel
    func configure(with viewModel: ViewModel)
}

public extension Configurable {
    func config(with viewModel: Any) {
        if let concreteViewModel = viewModel as? ViewModel {
            configure(with: concreteViewModel)
        } else {
            assertionFailure(
                """
                    Invalid ViewModel type,
                    expect \(String(reflecting: ViewModel.self))
                    got: \(String(reflecting: viewModel.self))
                """
            )
        }
    }
}
