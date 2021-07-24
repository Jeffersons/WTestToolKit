//
//  PostalAndLocationView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

extension PostalAndLocationView {
    struct Appearance: UIGridPT {
        let xxxs = 1
        let postalCodeWidth = 96.0
    }
}

public class PostalAndLocationView: UIView {
    fileprivate let appearance = Appearance()
    private let postalCodeLabel = PostalCodeLabel()
    private let locationLabel = LocationLabel()
    lazy var separator: UIView = {
       let view = UIView()
       view.backgroundColor = Colors.clBlack.color
       return view
    }()

    // MARK: Do Int
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension PostalAndLocationView {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(postalCodeLabel)
        addSubview(locationLabel)
        addSubview(separator)
    }

    // MARK: Do Constraints
    func makeConstraints() {
        postalCodeLabel.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
            $0.width.equalTo(appearance.postalCodeWidth)
        }
        locationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(postalCodeLabel.snp.trailing).offset(36)
            $0.trailing.equalToSuperview()
        }
        separator.snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.height.equalTo(appearance.xxxs)
            $0.width.equalToSuperview().inset(20)
        }
    }
}

// MARK: Do Configurable
extension PostalAndLocationView: Configurable {
    public struct ViewModel {
        public let postalText: String
        public let locationText: String
        public init(postalText: String, locationText: String) {
            self.postalText = postalText
            self.locationText = locationText
        }
    }
    public func configure(with viewModel: PostalAndLocationView.ViewModel) {
        postalCodeLabel.configure(with: .init(postalCode: viewModel.postalText))
        locationLabel.configure(with: .init(locationText: viewModel.locationText))
    }
}
