//
//  RootViewModel.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

enum RootType: String {
    case atom = "Atoms"
    case molecule = "Molecules"
    case organism = "Organisms"
    case template = "Templates"

    var image: UIImage? {
        let namedImage = String(describing: self)
        return UIImage(named: "ic\(namedImage.capitalized)")
    }
}

class RootViewModel {
    let type: RootType

    init(type: RootType) {
        self.type = type
    }
}
