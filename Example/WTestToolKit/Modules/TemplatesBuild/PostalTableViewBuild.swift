//
//  PostalTableViewBuild.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

public final class PostalTableViewBuild {
    public init() {}

    public func build() -> UIView {
        var dataSource = [PostalAndLocationView.ViewModel(postalText: "3750-364", locationText: "Belazaima do Chão")]
        dataSource.append(PostalAndLocationView.ViewModel(postalText: "3780-425", locationText: "Avelãs de Cima"))
        dataSource.append(PostalAndLocationView.ViewModel(postalText: "7300-238", locationText: "Portalegre"))
        dataSource.append(PostalAndLocationView.ViewModel(postalText: "4925-413", locationText: "Lanheses"))
        dataSource.append(PostalAndLocationView.ViewModel(postalText: "2695-650", locationText: "São João da Talha"))
        let view = PostalTableView(dataSource: dataSource)
        let container = ContainerView(view: view)
        view.backgroundColor = Colors.clWhite.color
        container.backgroundColor = Colors.clWhite.color
        view.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
        return container
    }
}
