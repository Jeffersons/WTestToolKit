//
//  DownloadView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//

import SnapKit

extension DownloadView {
    struct Appearance: UIGridPT {
        let waitViewHeight = 150.0
        let continueWidth = 180.0
    }
}

public class DownloadView: UIView {
    fileprivate let appearance = Appearance()
    public var continueAction: (() -> Void)?

    private lazy var waitAnimationView = WaitAnimationView()
    private lazy var indexInfo = TitleH2()
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.clGray.color
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        button.setTitle(Text.downloadViewContinue, for: .normal)
        button.isEnabled = false
        return button
    }()

    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc
    func continueButtonPressed() {
        continueAction?()
    }
}

// MARK: Private Functions
private extension DownloadView {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(waitAnimationView)
        addSubview(continueButton)
        addSubview(indexInfo)
    }
    // MARK: Do Constraints
    func makeConstraints() {
        waitAnimationView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(appearance.waitViewHeight)
        }
        continueButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(appearance.continueWidth)
            $0.height.equalTo(appearance.xxlSpace)
            $0.bottom.equalToSuperview().inset(appearance.lSpace)
        }
        indexInfo.snp.makeConstraints {
            $0.bottom.equalTo(continueButton.snp.bottom).inset(appearance.xxxlSpace)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: Do Configurable
extension DownloadView: Configurable {
    public struct ViewModel {
        public let progress: CGFloat
        public let indexInfo: String?

        public init(progress: CGFloat, indexInfo: String? = nil) {
            self.progress = progress
            self.indexInfo = indexInfo
        }
    }

    public func configure(with viewModel: DownloadView.ViewModel) {
        if viewModel.progress > 0.99 {
            continueButton.isEnabled = true
            continueButton.backgroundColor = .systemBlue
        }
        if let infoPostalCode = viewModel.indexInfo {
            let info = "\(Text.downloadviewIndexed): \(infoPostalCode)"
            indexInfo.configure(with: .init(title: info))
        }
        waitAnimationView.configure(with: .init(progress: viewModel.progress))
    }
}
