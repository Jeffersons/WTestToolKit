//
//  CheckmarkAnimationBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class CheckmarkAnimationBuild {
    public init() {}
    
    public func build() -> UIView {
        let view = CheckmarkAnimationView()
        let container = ContainerView(view: view)
        view.snp.makeConstraints { make in
            make.centerY.centerY.equalToSuperview()
            make.height.width.equalTo(48)
        }
        view.startAnimation()
        return container
    }
}
