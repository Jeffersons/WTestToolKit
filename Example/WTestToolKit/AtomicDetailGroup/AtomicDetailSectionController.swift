//
//  AtomicDetailSectionController.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class AtomicDetailSectionController: UIViewController {
    var viewModel: AtomicDetailViewModel
    let interactor: AtomicDetailBusinessLogic
    
    init(interactor: AtomicDetailBusinessLogic, viewModel: AtomicDetailViewModel) {
        self.interactor = interactor
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = viewModel.view
        self.title = viewModel.title
    }
}
