//
//  HistoryViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//  Edited by Yujin Kim on 2023-08-20.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var userpostTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUserPostTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		userpostTableView.reloadData()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	private func setUserPostTableView() {
		userpostTableView.delegate = self
		userpostTableView.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return MockManager.shared.user.userpost.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = userpostTableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
		let target = MockManager.shared.user.userpost[indexPath.row]
		cell.titleLabel.text = target.title
		cell.contentLabel.text = target.content
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			MockManager.shared.user.userpost.remove(at: indexPath.row)
			MockManager.shared.defaultList.remove(at: indexPath.row)
			userpostTableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
}

class HistoryCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	
	static let reuseIdenifier = "HistoryCell"
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func setTodoCell() {
		accessoryType = .none
		selectionStyle = .default
	}
}
