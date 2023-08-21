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
	@IBOutlet weak var thumbView: UIView!
	@IBOutlet weak var thumbDownButton: UIButton!
	@IBOutlet weak var thumbUpButton: UIButton!
	
	@IBAction func selectDown(_ sender: UIButton) {
		thumbDownButton.isSelected.toggle()
		if thumbDownButton.isSelected {
			thumbDownButton.tintColor = ColorManager.nbcAccentColor
			thumbDownButton.setTitleColor(ColorManager.nbcAccentColor, for: .selected)
			thumbDownButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .selected)
		} else {
			thumbDownButton.tintColor = ColorManager.nbcTertiaryColor
			thumbDownButton.setTitleColor(ColorManager.nbcPrimaryColor, for: .normal)
			thumbDownButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
		}
	}
	
	@IBAction func selectUp(_ sender: UIButton) {
		thumbUpButton.isSelected.toggle()
		if thumbUpButton.isSelected {
			thumbUpButton.tintColor = ColorManager.nbcAccentColor
			thumbUpButton.setTitleColor(ColorManager.nbcAccentColor, for: .selected)
			thumbUpButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
		} else {
			thumbUpButton.tintColor = ColorManager.nbcTertiaryColor
			thumbUpButton.setTitleColor(ColorManager.nbcPrimaryColor, for: .normal)
			thumbUpButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
		}
	}
	
	var post: Post?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let selectedPost = post {
			DetailViewDecorator.run(detailViewController: self, selectedPost: selectedPost)
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
}

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
		detailViewController.datetimeLabel.text = selectedPost.username + selectedPost.date
	}
	
	private static func decoratePostImageView(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.postImageView.image = selectedPost.uiimage
	}
	
	private static func decorateContentLabel(_ detailViewController: DetailViewController, _ selectedPost: Post) {
		detailViewController.contentLabel.text = selectedPost.content
	}
}

