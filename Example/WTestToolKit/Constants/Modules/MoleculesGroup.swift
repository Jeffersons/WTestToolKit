//
//  MoleculesGroup.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum MoleculesGroup {
    static let molecules = [
        AtomicDetailViewModel(title: "PostalCodeLabel", view: PostalCodeLabelBuild().build()),
        AtomicDetailViewModel(title: "LocationLabel", view: LocationLabelBuild().build())
    ]
}
