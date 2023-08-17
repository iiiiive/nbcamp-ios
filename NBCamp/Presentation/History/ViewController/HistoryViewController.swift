//
//  HistoryViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class HistoryViewController: UIViewController {
	
	@IBOutlet weak var historyCollectionView: UICollectionView!
	
	private var postList: [Post] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		historyCollectionView.backgroundColor = ColorManager.nbcSurfaceColor
		historyCollectionView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellWithReuseIdentifier: "HistoryCell")
		setHistoryCollectionView()
		view.backgroundColor = ColorManager.nbcSurfaceColor
		navigationItem.title = "내가 쓴 글"
		
		// 포스트 목록 추가
		postList.append(
			Post(title: "파이썬 문법 기초 수강 중", content: "파이썬 문법 기초 뿌시자아아", username: "명세인", comments: 0, likes: 0)
		)
		postList.append(
			Post(title: "스토리보드 그만 쓰고 싶다", content: "어휴 너무 어렵다", username: "김유진", comments: 0, likes: 0)
		)
		historyCollectionView.reloadData()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	private func setHistoryCollectionView() {
		historyCollectionView.delegate = self
		historyCollectionView.dataSource = self
	}
}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	//MARK: 섹션에 보여질 아이템 개수
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return postList.count
	}
	//MARK: 섹션에 보여질 콜렉션 셀 정의
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
		let post = postList[indexPath.row]
		cell.configure(with: post)
		return cell
	}
}

class HistoryCell: UICollectionViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var showDetailLabel: UILabel!
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	func configure(with post: Post) {
		titleLabel.text = post.title
		contentLabel.text = post.content
	}
}
