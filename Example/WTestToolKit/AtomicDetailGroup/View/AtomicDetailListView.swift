//
//  AtomicDetailListView.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 22/07/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import SnapKit
import WTestToolKit

extension AtomicDetailListView {
    struct Appearance {}
}

class AtomicDetailListView: UIView {
    fileprivate let appearance = Appearance()

     lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Colors.clWhite.color
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        addSubview(tableView)
    }

    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
