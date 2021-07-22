//
//  UIGridPT.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//

// swiftlint:disable all
import UIKit
public protocol UIGridPT {
    /// The size of the minimum grid element
    static var gridUnitSize: CGSize { get }
}

public extension UIGridPT {
    /// The default minimum grid size value is 4
    static var gridUnitSize: CGSize { CGSize(4) }
    /// = 1
    static var xxxs: CGFloat { 1 }
    /// = 2
    static var xxs: CGFloat { 2 }
    /// = 3
    static var xs: CGFloat { 3 }
    /// = 4
    static var s: CGFloat { 4 }
    /// = 6
    static var m: CGFloat { 6 }
    /// = 8
    static var l: CGFloat { 8 }
    /// = 9
    static var xl: CGFloat { 9 }
    /// = 12
    static var xxl: CGFloat { 12 }
    /// = 18
    static var xxxl: CGFloat { 18 }

    /// {4, 4, 4, 4}, if gridUnitSize is not overridden
    var xxxsInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xxxs }
    /// {8, 8, 8, 8}, if gridUnitSize is not overridden
    var xxsInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xxs }
    /// {12, 12, 12, 12}, if gridUnitSize is not overridden
    var xsInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xs }
    /// {16, 16, 16, 16}, if gridUnitSize is not overridden
    var sInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.s }
    /// {24, 24, 24, 24}, if gridUnitSize is not overridden
    var mInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.m }
    /// {32, 32, 32, 32}, if gridUnitSize is not overridden
    var lInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.l }
    /// {36, 36, 36, 36}, if gridUnitSize is not overridden
    var xlInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xl }
    /// {48, 48, 48, 48}, if gridUnitSize is not overridden
    var xxlInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xxl }
    /// {72, 72, 72, 72}, if gridUnitSize is not overridden
    var xxxlInsets: UIEdgeInsets { UIEdgeInsets(Self.gridUnitSize) * Self.xxxl }

    /// = 4, if gridUnitSize is not overridden
    var xxxsSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xxxs) }
    /// = 8, if gridUnitSize is not overridden
    var xxsSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xxs) }
    /// = 12, if gridUnitSize is not overridden
    var xsSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xs) }
    /// = 16, if gridUnitSize is not overridden
    var sSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.s) }
    /// = 24, if gridUnitSize is not overridden
    var mSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.m) }
    /// = 32, if gridUnitSize is not overridden
    var lSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.l) }
    /// = 36, if gridUnitSize is not overridden
    var xlSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xl) }
    /// = 48, if gridUnitSize is not overridden
    var xxlSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xxl) }
    /// = 72, if gridUnitSize is not overridden
    var xxxlSpace: CGFloat { Self.gridUnitSize.height * CGFloat(Self.xxxl) }

    /// {4, 4}, if gridUnitSize is not overridden
    var xxxsSize: CGSize { Self.gridUnitSize * Self.xxxs }
    /// {8, 8}, if gridUnitSize is not overridden
    var xxsSize: CGSize { Self.gridUnitSize * Self.xxs }
    /// {12, 12}, if gridUnitSize is not overridden
    var xsSize: CGSize { Self.gridUnitSize * Self.xs }
    /// {16, 16}, if gridUnitSize is not overridden
    var sSize: CGSize { Self.gridUnitSize * Self.s }
    /// {24, 24}, if gridUnitSize is not overridden
    var mSize: CGSize { Self.gridUnitSize * Self.m }
    /// {32, 32}, if gridUnitSize is not overridden
    var lSize: CGSize { Self.gridUnitSize * Self.l }
    /// {36, 36}, if gridUnitSize is not overridden
    var xlSize: CGSize { Self.gridUnitSize * Self.xl }
    /// {48, 48}, if gridUnitSize is not overridden
    var xxlSize: CGSize { Self.gridUnitSize * Self.xxl }
    /// {72, 72}, if gridUnitSize is not overridden
    var xxxlSize: CGSize { Self.gridUnitSize * Self.xxxl }

    /// {4, 4}, if gridUnitSize is not overridden
    var xxxsOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xxxs }
    /// {8, 8}, if gridUnitSize is not overridden
    var xxsOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xxs }
    /// {12, 12}, if gridUnitSize is not overridden
    var xsOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xs }
    /// {16, 16}, if gridUnitSize is not overridden
    var sOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.s }
    /// {24, 24}, if gridUnitSize is not overridden
    var mOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.m }
    /// {32, 32}, if gridUnitSize is not overridden
    var lOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.l }
    /// {36, 36}, if gridUnitSize is not overridden
    var xlOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xl }
    /// {48, 48}, if gridUnitSize is not overridden
    var xxlOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xxl }
    /// {72, 72}, if gridUnitSize is not overridden
    var xxxlOffset: UIOffset { UIOffset(Self.gridUnitSize) * Self.xxxl }

    /// Pixel size, depending on screen scale
    var pixelSize: CGFloat { CGFloat.pixelSize }
}

public extension CGFloat {
    /// Pixel size, depending on the scale of the screen
    var pixelSize: CGFloat { 1 / UIScreen.main.scale }
    static let pixelSize: CGFloat = 1 / UIScreen.main.scale
}

public extension CGSize {
    /// Initializes the structure with identical dimensions in height and width equal to the input parameter
    ///
    /// - Parameter size: size with which to initialize the structure
    init(_ size: CGFloat) {
        self.init(width: size, height: size)
    }

    /// Multiplies all structure elements by a factor
    ///
    /// - Parameters:
    ///   - lhs: CGSize source structure
    ///   - rhs: factor
    /// - Returns: the result of multiplying all elements by a factor
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}

extension UIOffset {
    /// Initializes the structure with no equal to the width and height of the input parameter
    ///
    /// - Parameter size: size with which to initialize the structure
    init(_ size: CGSize) {
        self.init(horizontal: size.width, vertical: size.height)
    }

    /// Multiplies all structure elements by a factor
    ///
    /// - Parameters:
    ///   - lhs: original UIOffset structure
    ///   - rhs: factor
    /// - Returns: the result of multiplying all elements by a factor
    static func * (lhs: UIOffset, rhs: CGFloat) -> UIOffset {
        UIOffset(horizontal: lhs.horizontal * rhs, vertical: lhs.vertical * rhs)
    }
}

public extension UIEdgeInsets {
    /// Initializes a structure with pairs of identical heights, above and below equal height, left and right - width
    ///
    /// - Parameter size: indentation height and width
    init(_ size: CGSize) {
        self.init(top: size.height, left: size.width, bottom: size.height, right: size.width)
    }

    /// Умножает все элементы структуры на множитель
    ///
    /// - Parameters:
    ///   - lhs: Multiplies all structure elements by a factor
    ///   - rhs: factor
    /// - Returns: the result of multiplying all elements by a factor
    static func * (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(top: lhs.top * rhs, left: lhs.left * rhs, bottom: lhs.bottom * rhs, right: lhs.right * rhs)
    }

    /// Initializes the structure with the specified vertical and horizontal margins
    init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    /// Initializes the structure with equal indentation on all sides
    init(uniform: CGFloat) {
        self.init(top: uniform, left: uniform, bottom: uniform, right: uniform)
    }

    /// Returns a new structure with the specified indentation at the top
    func with(top: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.top = top
        return inset
    }

    /// Returns a new structure with the specified indent on the left
    func with(left: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.left = left
        return inset
    }

    /// Returns a new structure with the specified bottom indent
    func with(bottom: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.bottom = bottom
        return inset
    }

    /// Returns a new structure with the specified indent on the right
    func with(right: CGFloat) -> UIEdgeInsets {
        var inset = self
        inset.right = right
        return inset
    }

    /// Returns a new structure with zero top indent
    func withoutTop() -> UIEdgeInsets { with(top: 0) }

    /// Returns a new structure with zero left indentation
    func withoutLeft() -> UIEdgeInsets { with(left: 0) }

    /// Returns a new structure with zero bottom indentation
    func withoutBottom() -> UIEdgeInsets { with(bottom: 0) }

    /// Returns a new structure with zero right indentation
    func withoutRight() -> UIEdgeInsets { with(right: 0) }
}
