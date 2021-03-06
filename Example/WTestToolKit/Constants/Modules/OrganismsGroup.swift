//
//  OrganismsGroup.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum OrganismsGroup {
    static let organisms = [
        AtomicDetailViewModel(title: "PostalAndLocation Cell", view: PostalAndLocationBuild().build()),
        AtomicDetailViewModel(title: "DownloadView", view: DownloadBuild().build())
    ]
}
