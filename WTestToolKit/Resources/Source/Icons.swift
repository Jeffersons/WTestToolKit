//
//  Icons.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import UIKit.UIImage

public typealias AssetImageTypeAlias = UIImage

// MARK: - Icon Catalog
public enum Icons {
    public static let icLocation = ImageAsset(name: "icLocation")
    public static let icPostalCode = ImageAsset(name: "icPostalCode")
}

public struct ImageAsset {
    public fileprivate(set) var name: String
    public var image: AssetImageTypeAlias {
        let bundle = Bundle(for: BundleToken.self)
        let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
        guard let result = image else { fatalError("Unable to load image named \(name).") }
        return result
    }
}

public extension AssetImageTypeAlias {
    convenience init!(asset: ImageAsset) {
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
    }
}

private final class BundleToken {}
