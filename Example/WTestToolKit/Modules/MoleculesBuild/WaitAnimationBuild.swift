//
//  WaitAnimationGroupBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class WaitAnimationGroupBuild {
    public init() { }
    
    public func build() -> UIView {
        let view = WaitAnimationView()
        let container = ContainerView(view: view)
        view.snp.makeConstraints { make in
            make.size.centerY.centerX.equalToSuperview()
        }
        var secondsRemaining = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            if secondsRemaining < 1.01 {
                let progress = CGFloat(secondsRemaining)
                view.configure(with: .init(progress: progress))
                secondsRemaining += 0.01
            } else {
                Timer.invalidate()
            }
        }
        return container
    }
}
