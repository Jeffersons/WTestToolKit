//
//  RootListView.swift
//  WTestToolKit_Example
//
//  Created by Jefferson de Souza Batista on 21/07/21.
//

import SnapKit
import UIKit

extension RootListView {
    struct Appearance {
        let headerHeight = 115.0
        let topOffset = 60.0
    }
}

class RootListView: UIView {
    fileprivate let appearance = Appearance()
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "WTestToolKit: \n V0.1"
        label.font = label.font.withSize(16.0)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
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
        addSubview(headerView)
        headerView.addSubview(versionLabel)
    }
    
    func makeConstraints() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(appearance.headerHeight)
        }
        versionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(appearance.topOffset)
            $0.centerX.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
