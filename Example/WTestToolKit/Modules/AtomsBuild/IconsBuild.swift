//
//  IconsBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class IconsBuild {
    public init() {}

    public func build() -> UIView {
        let stackContainer: UIView = {
            let view = UIView()
            return view
        }()
        
        let horizontalStack: UIStackView = {
            let view = UIStackView()
            view.distribution = .fillProportionally
            view.axis = .horizontal
            view.alignment = .leading
            view.spacing = 32
            return view
        }()
        
        
        let icPostalCode = IconView()
        icPostalCode.configure(with: IconView.ViewModel(image: Icons.icPostalCode.image))
        
        let icLocation = IconView()
        icLocation.configure(with: IconView.ViewModel(image: Icons.icLocation.image))
        
        stackContainer.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(icPostalCode)
        horizontalStack.addArrangedSubview(icLocation)
        
        let container = ContainerView(view: stackContainer)
        stackContainer.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        horizontalStack.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        return container
    }
}
