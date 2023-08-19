//
//  DetailViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-19.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var datetimeLabel: UILabel!
	@IBOutlet weak var postImageView: UIImageView!
	@IBOutlet weak var contentLabel: UITextView!
	
	var post: Post
	
	override func viewDidLoad() {
		super.viewDidLoad()
		DetailViewDecorator.run(detailViewController: self, selectedPost: post)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
//MARK: 게시글 상세 뷰 데코레이터
class DetailViewDecorator {
	static func run(detailViewController: DetailViewController, selectedPost: Post) {
		decorateTitleLabel(detailViewController, selectedPost)
		decorateDateTimeLabel(detailViewController, selectedPost)
		decoratePostImageView(detailViewController, selectedPost)
		decorateContentLabel(detailViewController, selectedPost)
	}
	
	private static func decorateTitleLabel(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.titleLabel.text = selectedPost.title
	}
	
	private static func decorateDateTimeLabel(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.datetimeLabel.text = selectedPost.date
	}
	
	private static func decoratePostImageView(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.postImageView.image = selectedPost.uiimage
	}
	
	private static func decorateContentLabel(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.contentLabel.text = selectedPost.content
	}
}

