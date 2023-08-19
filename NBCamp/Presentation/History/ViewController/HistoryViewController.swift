//
//  HistoryViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
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
		print("히스토리 뷰 컨트롤러: \(MockManager.shared.user.userpost)")
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
}

class HistoryCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
}
