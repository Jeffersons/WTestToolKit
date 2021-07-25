//
//  GradientHorizontalProgressBar.swift
//  ProgrssBars
//
//  Created by Marina on 09/05/2020.
//  Copyright © 2020 Marina. All rights reserved.
//

import Foundation
import UIKit

public class GradientHorizontalProgressBar: UIView {
    var colorRed: CGFloat = 250
    var colorGreen: CGFloat = 186
    var colorBlue: CGFloat = 218

    var gradientRed: CGFloat = 255
    var gradientGreen: CGFloat = 255
    var gradientBlue: CGFloat = 255
    var color: UIColor = .gray {
        didSet { setNeedsDisplay() }
    }
    var gradientColor: UIColor = .white {
        didSet { setNeedsDisplay() }
    }

    public var progress: CGFloat = 10 {
        didSet { setNeedsDisplay() }
    }

    private let progressLayer = CALayer()
    private let gradientLayer = CAGradientLayer()
    private let backgroundMask = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
        createAnimation()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
        createAnimation()
    }

    private func setupLayers() {
        layer.addSublayer(gradientLayer)

        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    }

    private func createAnimation() {
        let flowAnimation = CABasicAnimation(keyPath: "locations")
        flowAnimation.fromValue = [-0.3, -0.15, 0]
        flowAnimation.toValue = [1, 1.15, 1.3]

        flowAnimation.isRemovedOnCompletion = false
        flowAnimation.repeatCount = Float.infinity
        flowAnimation.duration = 1

        gradientLayer.add(flowAnimation, forKey: "flowAnimation")
    }
    public func progressChanged(progress: CGFloat) {
        self.progress = progress
        colorChanged(progress: progress)
    }
    private func colorChanged(progress: CGFloat) {
//        colorRed = progress
        updateColors()
    }
    private func updateColors() {
        let mainColor = UIColor(red: colorRed / 255, green: colorGreen / 255, blue: colorBlue / 255, alpha: 1)
        let gradient = UIColor(red: gradientRed / 255, green: gradientGreen / 255, blue: gradientBlue / 255, alpha: 1)

        self.color = mainColor
        self.gradientColor = gradient

        self.tintColor = mainColor
    }

    public override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))

        progressLayer.frame = progressRect
        progressLayer.backgroundColor = UIColor.black.cgColor

        gradientLayer.frame = rect
        gradientLayer.colors = [color.cgColor, gradientColor.cgColor, color.cgColor]
        gradientLayer.endPoint = CGPoint(x: progress, y: 0.5)
    }
}
