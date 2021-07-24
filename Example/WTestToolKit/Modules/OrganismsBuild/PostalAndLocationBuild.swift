//
//  PostalAndLocationBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class PostalAndLocationBuild {
    public init() { }
    
    public func build() -> UIView {
        let view = PostalAndLocationView()
        view.configure(with: .init(postalText: "3750-364", locationText: "Belazaima do Chão"))
        let container = ContainerView(view: view)
        view.snp.makeConstraints { make in
               make.centerX.centerY.equalToSuperview()
               make.width.equalToSuperview().inset(20)
               make.height.equalTo(54)
           }
        return container
    }
}
