//
//  LocationLabel.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

extension LocationLabel {
    struct Appearance: UIGridPT {
        let iconSize = 24.0
        let marginLeft = 4.0
    }
}

public class LocationLabel: UIView {
    fileprivate let appearance = Appearance()
    private lazy var locationLabel = TitleH2()

    private lazy var icLocation: IconView = {
        let icon = IconView()
        icon.configure(with: IconView.ViewModel(image: Icons.icLocation.image))
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
private extension LocationLabel {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(icLocation)
        addSubview(locationLabel)
    }
    // MARK: Do Constraints
    func makeConstraints() {
        icLocation.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(appearance.iconSize)
        }
        locationLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
            $0.leading.equalTo(icLocation.snp.trailing).offset(appearance.marginLeft)
        }
    }
}

// MARK: Do Configurable
extension LocationLabel: Configurable {
    public struct ViewModel {
        public let locationText: String

        public init(locationText: String) {
            self.locationText = locationText
        }
    }

    public func configure(with viewModel: LocationLabel.ViewModel) {
        locationLabel.configure(with: TitleH2.ViewModel(title: viewModel.locationText))
        accessibilityElements = [locationLabel]
    }
}
