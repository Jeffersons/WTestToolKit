//
//  RootWorker.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//

import Foundation

protocol RootWorkerProtocol {
    func fetchRootList() -> [RootViewModel]
}

class RootWorker: RootWorkerProtocol {
    func fetchRootList() -> [RootViewModel] {
        let rootListModel = [
            RootViewModel(type: .atom),
            RootViewModel(type: .molecule),
            RootViewModel(type: .organism),
            RootViewModel(type: .template),
        ]
        return rootListModel
    }
}
