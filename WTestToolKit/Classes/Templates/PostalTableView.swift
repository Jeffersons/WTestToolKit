//
//  PostalTableView.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 24/07/21.
//

import SnapKit

extension PostalTableView {
    struct Appearance: UIGridPT {
        let rowHeight: CGFloat = 64
    }
}

public class PostalTableView: UIView {
    fileprivate let appearance = Appearance()
    private var dataSource: [PostalAndLocationView.ViewModel]

    public lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Colors.clWhite.color
        tableView.rowHeight = appearance.rowHeight
        tableView.register(PostalAndLocationCell.self, forCellReuseIdentifier: PostalAndLocationCell.reuseIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    public override init(frame: CGRect = CGRect.zero) {
        self.dataSource = []

        super.init(frame: frame)
        commonInit()
    }

    public init(dataSource: [PostalAndLocationView.ViewModel]) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        commonInit()
    }

    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        addSubviews()
        makeConstraints()
        tableView.dataSource = self
    }

    func addSubviews() {
        addSubview(tableView)
    }

    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension PostalTableView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostalAndLocationCell.reuseIdentifier)
            as? PostalAndLocationCell else {
            return UITableViewCell()
        }
        cell.configure(with: dataSource[indexPath.row])
        return cell
    }
}
