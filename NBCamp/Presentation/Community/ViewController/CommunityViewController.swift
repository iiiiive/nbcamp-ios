//
//  CommunityViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//  Edited by Hyunwoo Lee on 2023-08-16.
//  Edited by Yujin Kim on 2023-08-21.
//

import UIKit

class CommunityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	@IBOutlet weak var postCollectionView: UICollectionView!
	@IBOutlet weak var sortButton: UIButton!
	@IBAction func sort(_ sender: UIButton) {
		if sortButton.isSelected {
			sender.setImage(UIImage(named: "text.line.first.and.arrowtriangle.forward"), for: .normal)
			MockManager.shared.defaultList.sort(by: { $1.id < $0.id })
		} else {
			sender.setImage(UIImage(named: "text.line.last.and.arrowtriangle.forward"), for: .selected)
			MockManager.shared.defaultList.sort(by: { $0.id < $1.id })
		}
		sortButton.isSelected.toggle()
		postCollectionView.reloadData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setPostCollectionView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print(MockManager.shared.defaultList)
		postCollectionView.reloadData()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print(MockManager.shared.defaultList)
	}
	
	private func setPostCollectionView() {
		postCollectionView.delegate = self
		postCollectionView.dataSource = self
	}
	
	private var selectedPost: Post?
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return MockManager.shared.defaultList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
		let target = MockManager.shared.defaultList[indexPath.row]
		cell.titleLabel.text = target.title
		cell.contentLabel.text = target.content
		cell.usernameLabel.text = target.username + " " + target.date
		cell.previewImage.image = target.uiimage
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let target = MockManager.shared.defaultList[indexPath.row]
		if let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			detailViewController.post = target
			navigationController?.pushViewController(detailViewController, animated: true)
		}
	}
}

class PostCell: UICollectionViewCell {
	@IBOutlet weak var previewImage: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var usernameLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCell()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupCell()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setPreviewImage()
	}
	
	func setupCell() {
		contentView.layer.cornerRadius = 10
		contentView.layer.borderWidth = CGFloat(1.0)
		contentView.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		contentView.clipsToBounds = true
	}
	
	func setPreviewImage() {
		previewImage.layer.cornerRadius = CGFloat(10.0)
	}
}
