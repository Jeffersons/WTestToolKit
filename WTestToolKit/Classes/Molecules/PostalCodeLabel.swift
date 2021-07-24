//
//  PostalCodeLabel.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

extension PostalCodeLabel {
    struct Appearance: UIGridPT {
        let iconSize = 24.0
        let marginLeft = 4.0
    }
}

public class PostalCodeLabel: UIView {
    fileprivate let appearance = Appearance()
    private let postalCodeLabel = TitleH1()

    private lazy var icPostalCode: IconView = {
        let icon = IconView()
        icon.configure(with: IconView.ViewModel(image: Icons.icPostalCode.image))
        return icon
    }()

    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension PostalCodeLabel {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(icPostalCode)
        addSubview(postalCodeLabel)
    }
    // MARK: Do Constraints
    func makeConstraints() {
        icPostalCode.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(appearance.sSpace)
            $0.size.equalTo(appearance.iconSize)
        }
        postalCodeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(icPostalCode.snp.trailing).offset(appearance.marginLeft)
        }
    }
}

// MARK: Do Configurable
extension PostalCodeLabel: Configurable {
    public struct ViewModel {
        public let postalCode: String

        public init(postalCode: String) {
            self.postalCode = postalCode
        }
    }

    public func configure(with viewModel: PostalCodeLabel.ViewModel) {
        postalCodeLabel.configure(with: TitleH1.ViewModel(title: viewModel.postalCode))
        accessibilityElements = [postalCodeLabel]
    }
}
