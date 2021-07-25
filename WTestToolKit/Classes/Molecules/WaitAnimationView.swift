//
//  WaitAnimationView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//

import SnapKit

extension WaitAnimationView {
    struct Appearance: UIGridPT {}
}

public class WaitAnimationView: UIView {
    fileprivate let appearance = Appearance()

    private lazy var container = UIView()
    private lazy var percentLabel = TitleH2()
    private lazy var downloadAnimation = DownloadAnimationView()
    private lazy var checkmarkAnimation: CheckmarkAnimationView = {
        let view = CheckmarkAnimationView()
        view.isHidden = true
        return view
    }()
    private lazy var downloadInfo: TitleH2 = {
        let label = TitleH2()
        label.configure(with: .init(title: Text.waitAnimationDownloadProgress))
        return label
    }()
    private lazy var horizontalProgressBar = GradientHorizontalProgressBar()

    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension WaitAnimationView {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
        downloadAnimation.startAnimation()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(container)
        addSubview(percentLabel)
        addSubview(downloadInfo)
        addSubview(downloadAnimation)
        addSubview(checkmarkAnimation)
        container.addSubview(horizontalProgressBar)
    }
    // MARK: Do Constraints
    func makeConstraints() {
        downloadAnimation.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(appearance.mSpace)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(appearance.xxxlSize)
        }
        checkmarkAnimation.snp.makeConstraints {
            $0.center.equalTo(downloadAnimation.snp.center)
            $0.size.equalTo(appearance.xxxlSize)
        }
        container.snp.makeConstraints {
            $0.top.equalTo(downloadAnimation.snp.bottom).offset(appearance.xxsSpace)
            $0.height.equalTo(appearance.xsSpace)
            $0.trailing.equalToSuperview().inset(appearance.lSpace)
            $0.leading.equalTo(percentLabel.snp.trailing).offset(appearance.xxxsSpace)
        }
        percentLabel.snp.makeConstraints {
            $0.centerY.equalTo(container.snp.centerY)
            $0.width.equalTo(appearance.xxlSpace)
            $0.leading.equalToSuperview().offset(appearance.sSpace)
        }
        downloadInfo.snp.makeConstraints {
            $0.top.equalTo(percentLabel.snp.bottom).offset(appearance.xxlSpace)
            $0.centerX.equalToSuperview()
        }
        horizontalProgressBar.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.size.equalToSuperview()
        }
    }
}

// MARK: Do Configurable
extension WaitAnimationView: Configurable {
    public struct ViewModel {
        public let progress: CGFloat

        public init(progress: CGFloat) {
            self.progress = progress
        }
    }

    public func configure(with viewModel: WaitAnimationView.ViewModel) {
        horizontalProgressBar.progressChanged(progress: viewModel.progress)
        if viewModel.progress < 1.0 {
            percentLabel.configure(with: .init(title: "\(String(format: "%.0f%%", viewModel.progress * 100))"))
        } else {
            downloadInfo.configure(with: .init(title: Text.waitAnimationIndexZipcode))
            percentLabel.configure(with: .init(title: "100%"))
            downloadAnimation.stopAnimation()
            downloadAnimation.isHidden = true
            checkmarkAnimation.isHidden = false
            checkmarkAnimation.startAnimation()
        }
    }
}
