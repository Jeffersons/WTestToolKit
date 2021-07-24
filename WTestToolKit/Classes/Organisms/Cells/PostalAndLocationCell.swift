//
//  PostalAndLocationCell.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

public class PostalAndLocationCell: UITableViewCell {
    static let reuseIdentifier = String(describing: PostalAndLocationCell.self)

    private(set) lazy var viewCell = PostalAndLocationView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = Colors.clWhite.color
        contentView.addSubview(viewCell)
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeConstraints() {
        viewCell.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
    }
}

extension PostalAndLocationCell: Configurable {
    public func configure(with viewModel: PostalAndLocationView.ViewModel) {
        viewCell.configure(with: viewModel)
    }
}
