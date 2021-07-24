//
//  TitlesBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class TitlesBuild {
    public init() {}

    public func build() -> UIView {
        let stackContainer: UIView = {
            let view = UIView()
            return view
        }()
        
        let verticalStack: UIStackView = {
            let view = UIStackView()
            view.distribution = .fillEqually
            view.axis = .vertical
            view.alignment = .leading
            view.spacing = 50
            return view
        }()
        
        
        let titleH1 = TitleH1()
        titleH1.configure(with: TitleH1.ViewModel(title: "Titles H1:\n 3750-364"))
        
        let titleH2 = TitleH2()
        titleH2.configure(with: TitleH2.ViewModel(title: "Titles H2:\n Belazaima do Chão"))
        
        stackContainer.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleH1)
        verticalStack.addArrangedSubview(titleH2)
        
        let container = ContainerView(view: stackContainer)
        stackContainer.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        verticalStack.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        return container
    }
}
