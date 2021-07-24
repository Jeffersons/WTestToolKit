//
//  IconView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

extension IconView {
    struct Appearance: UIGridPT {}
}

public class IconView: UIView {
    fileprivate let appearance = Appearance()

    // MARK: Do Icon
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.clGray.color
        imageView.contentMode = .scaleAspectFit
        return imageView
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
private extension IconView {
    // MARK: Do Common Init
    func commonInit() {
        addSubviews()
        makeConstraints()
    }
    // MARK: Do Add Subviews
    func addSubviews() {
        addSubview(icon)
    }

    // MARK: Do Constraints
    func makeConstraints() {
        icon.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(appearance.mSize)
        }
    }
}

// MARK: Do Configurable
extension IconView: Configurable {
    public struct ViewModel {
        public let image: UIImage
        public init(image: UIImage) {
            self.image = image
        }
    }
    public func configure(with viewModel: IconView.ViewModel) {
        icon.image = viewModel.image
    }
}
