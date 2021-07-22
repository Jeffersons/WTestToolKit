//
//  RootListCell.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import WTestToolKit

extension RootListCell {
    struct Appearance: UIGridPT {
        let xxxs = 1
        let iconLeft = 20
        let iconSize = 24
        let titleLeading = 24
    }
}

class RootListCell: UITableViewCell {
    fileprivate let appearance = Appearance()
    
    private lazy var view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.textAlignment = .left
        return label
    }()
    
    lazy var separator: UIView = {
           let view = UIView()
           view.backgroundColor = .black
           return view
       }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        view.addSubview(iconImage)
        view.addSubview(titleLabel)
        view.addSubview(separator)
        contentView.addSubview(view)
    }

    private func makeConstraints() {
        view.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().offset(appearance.xsSpace)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(appearance.sSpace)
            $0.trailing.equalToSuperview().inset(appearance.sSpace)
        }
        iconImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(appearance.iconSize)
            $0.leading.equalTo(appearance.iconLeft)
        }
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(iconImage.snp.trailing).offset(appearance.titleLeading)
        }
        separator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(appearance.xxxs)
            $0.width.centerX.equalToSuperview()
        }
    }
}

extension RootListCell: Configurable {
    final class ViewModel {
        let title: String
        let type: RootType?
        let image: UIImage

        public static let empty = ViewModel(title: "", type: nil, image: UIImage())

        init(title: String, type: RootType?, image: UIImage) {
            self.title = title
            self.type = type
            self.image = image
        }

        func diffIdentifier() -> NSObjectProtocol {
            return title as NSObjectProtocol
        }
    }

    func configure(with viewModel: RootListCell.ViewModel) {
        iconImage.image = viewModel.type?.image
        titleLabel.text = viewModel.title
        titleLabel.accessibilityLabel = viewModel.title
        accessibilityElements = [titleLabel]
    }
}

extension RootListCell {
    func bindViewModel(_ viewModel: Any) {
        guard let rootViewModel = viewModel as? RootListCell.ViewModel else { return }
        configure(with: rootViewModel)
    }
}
