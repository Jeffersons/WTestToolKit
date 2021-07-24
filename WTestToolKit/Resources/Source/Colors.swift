//
//  Colors.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import UIKit.UIColor
public typealias AssetColorTypeAlias = UIColor

// MARK: - Colors Catalog
public enum Colors {
    public static let clBlack = ColorAsset(name: "clBlack")
    public static let clGray = ColorAsset(name: "clGray")
    public static let clWhite = ColorAsset(name: "clWhite")
}

// MARK: - ColorAsset Implementation
public struct ColorAsset {
    public fileprivate(set) var name: String
    public var color: AssetColorTypeAlias {
        AssetColorTypeAlias(asset: self)
    }
}

public extension AssetColorTypeAlias {
    convenience init!(asset: ColorAsset) {
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
    }
}

private final class BundleToken {}
