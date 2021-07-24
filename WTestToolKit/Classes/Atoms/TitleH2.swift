//
//  TitleH2.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

public class TitleH2: UIView {
    // MARK: Do Title
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.clGray.color
        label.textAlignment = .left
        label.font = label.font.withSize(14.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    // MARK: Do Init
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }

    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(titleLabel)
    }

    // MARK: Do Constraints
    func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.width.equalToSuperview()
        }
    }
}

// MARK: Do Configurable
extension TitleH2: Configurable {
    public struct ViewModel {
        public let title: String
        public init(title: String) {
            self.title = title
        }
    }

    public func configure(with viewModel: TitleH2.ViewModel) {
        titleLabel.text = viewModel.title
    }
}
