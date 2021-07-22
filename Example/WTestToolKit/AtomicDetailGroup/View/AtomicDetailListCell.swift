//
//  AtomicDetailListCell.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

extension AtomicDetailListCell {
    struct Appearance {
        let xxxs = 1
        let titleLeading = 24
    }
}

class AtomicDetailListCell: UITableViewCell {
    static let reuseIdentifier = String(describing: AtomicDetailListCell.self)
    fileprivate let appearance = Appearance()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.textAlignment = .left
        return label
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor.white
        commonInit()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension AtomicDetailListCell {
    func commonInit() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(separator)
    }

    func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(appearance.titleLeading)
        }
        separator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(appearance.xxxs)
            $0.width.centerX.equalToSuperview()
        }
    }
}

extension AtomicDetailListCell: Configurable {
    final class ViewModel {
        let title: String
        let detail: AtomicDetailViewModel?

        public static let empty = ViewModel(title: "", detail: nil)

        init(title: String, detail: AtomicDetailViewModel?) {
            self.title = title
            self.detail = detail
        }

        func diffIdentifier() -> NSObjectProtocol {
            return title as NSObjectProtocol
        }
    }

    func configure(with viewModel: AtomicDetailListCell.ViewModel) {
        titleLabel.text = viewModel.title
        titleLabel.accessibilityLabel = viewModel.title
        accessibilityElements = [titleLabel]
    }
}

extension AtomicDetailListCell {
    func bindViewModel(_ viewModel: Any) {
        guard let rootViewModel = viewModel as? AtomicDetailListCell.ViewModel else {
            return
        }
        configure(with: rootViewModel)
    }
}
