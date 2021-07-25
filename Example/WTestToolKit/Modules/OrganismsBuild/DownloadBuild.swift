//
//  DownloadBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class DownloadBuild {
    public init() { }
    
    public func build() -> UIView {
        let view = DownloadView()
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
                view.configure(with: .init(progress: 1.0, indexInfo: "2695-650, São João da Talha"))
                Timer.invalidate()
            }
        }
        return container
    }
}
