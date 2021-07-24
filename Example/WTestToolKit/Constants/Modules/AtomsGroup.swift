//
//  AtomsGroup.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum AtomsGroup {
    static let atoms = [
        AtomicDetailViewModel(title: "Titles", view: TitlesBuild().build()),
        AtomicDetailViewModel(title: "Icons", view: IconsBuild().build())
    ]
}
