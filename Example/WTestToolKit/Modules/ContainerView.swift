//
//  ContainerView.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

class ContainerView: UIView {
    let view: UIView

    init(view: UIView) {
        self.view = view
        super.init(frame: .zero)
        commonInit()
    }

    override init(frame: CGRect) {
        self.view = UIView()
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        self.view = UIView()
        super.init(frame: .zero)
        commonInit()
    }
}

// MARK: Private Functions
private extension ContainerView {
    func commonInit() {
        backgroundColor = Colors.clWhite.color
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        addSubview(view)
    }

    func makeConstraints() {
        view.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
        }
    }
}
