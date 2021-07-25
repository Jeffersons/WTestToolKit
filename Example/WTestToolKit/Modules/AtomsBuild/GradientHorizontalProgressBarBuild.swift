//
//  GradientHorizontalProgressBarBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class GradientHorizontalProgressBarBuild {
    public init() {}
    
    public func build() -> UIView {
        let horizontalBar = GradientHorizontalProgressBar()
        let container = ContainerView(view: horizontalBar)
        horizontalBar.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalToSuperview().inset(40)
        }
        var secondsRemaining = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
            if secondsRemaining < 1.01 {
                let progress = CGFloat(secondsRemaining)
                horizontalBar.progressChanged(progress: progress)
                secondsRemaining += 0.01
            } else {
                Timer.invalidate()
            }
        }
        return container
    }
}
