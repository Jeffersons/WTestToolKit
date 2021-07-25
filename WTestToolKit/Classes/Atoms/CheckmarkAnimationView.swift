//
//  CheckmarkAnimationView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import Lottie
import SnapKit

extension CheckmarkAnimationView {
    struct Appearance: UIGridPT {}
}

public class CheckmarkAnimationView: UIView {
    fileprivate let appearance = Appearance()

    // MARK: Do Lottie reference View

    var animationView = AnimationView()

    // MARK: Do Animation Var

    private lazy var animation: AnimationView = {
        let animation = Animation.named("checkmark", bundle: Bundle(for: DownloadAnimationView.self))
        animationView.animation = animation
        animationView.loopMode = .playOnce
        return animationView
    }()

    // MARK: Do Init

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Do Start Animation

    public func startAnimation() {
        animationView.play()
    }

    // MARK: Do Stop Animation

    public func stopAnimation() {
        animation.removeFromSuperview()
        animationView.stop()
    }

    // MARK: Do Common Init

    func commonInit() {
        addSubviews()
        makeConstraints()
    }

    // MARK: Do Add Subviews

    func addSubviews() {
        addSubview(animation)
    }

    // MARK: Do Constraints

    func makeConstraints() {
        animation.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.size.equalTo(appearance.xxxlSize)
        }
    }
}
