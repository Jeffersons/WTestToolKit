//
//  LocationLabelBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//
import WTestToolKit

public final class LocationLabelBuild {
    public init() { }
    
    public func build() -> UIView {
        let view = LocationLabel()
        view.configure(with: LocationLabel.ViewModel(locationText: "Belazaima do Chão"))
        let container = ContainerView(view: view)
        view.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(48)
        }
        return container
    }
}
