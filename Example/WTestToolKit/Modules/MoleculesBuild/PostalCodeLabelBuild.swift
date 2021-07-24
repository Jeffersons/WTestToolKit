//
//  PostalCodeLabelBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class PostalCodeLabelBuild {
    public init() { }
    
    public func build() -> UIView {
        let view = PostalCodeLabel()
        view.configure(with: PostalCodeLabel.ViewModel(postalCode: "3750-364"))
        let container = ContainerView(view: view)
        view.snp.makeConstraints { make in
               make.centerX.centerY.equalToSuperview()
               make.width.equalToSuperview()
               make.height.equalTo(48)
           }
        return container
    }
}
