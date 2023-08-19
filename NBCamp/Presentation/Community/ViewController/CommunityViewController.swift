//
//  CommunityViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class CommunityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	@IBOutlet weak var postCollectionView: UICollectionView!
	@IBOutlet weak var sortButton: UIButton!
	
	@IBAction func sort(_ sender: UIButton) {
		if sortButton.isSelected {
			sender.setTitle("최신 순으로", for: .normal)
			MockManager.shared.defaultList.sort(by: { $1.id < $0.id })
		} else {
			sender.setTitle("오래된 순으로", for: .normal)
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
	
	//MARK: 이미지 캐시
	private var imageCaches: [Int: UIImage] = [:]
	private func setImage(for post: Post, completion: @escaping (UIImage?) -> Void) {
		if let cachedImage = imageCaches[post.id] {
			completion(cachedImage)
		} else if let imageurl = post.image, let url = URL(string: imageurl) {
			let session = URLSession.shared
			let task = session.dataTask(with: url) { data, response, error in
				if let data = data {
					let image = UIImage(data: data)
					self.imageCaches[post.id] = image // 이미지를 캐시에 저장
					completion(image)
				} else {
					print("Error loading image for post \(post.id): \(error?.localizedDescription ?? "")")
					completion(nil)
				}
			}
			task.resume()
		} else {
			completion(nil)
		}
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
		setImage(for: target) { image in
			DispatchQueue.main.async {
				cell.previewImage.image = image
			}
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		//		let target = MockManager.shared.defaultList[indexPath.row]
		//		if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
		//			detailVC.selectedPost = target
		//			navigationController?.pushViewController(detailVC, animated: true)
		//		}
	}
}

class PostCell: UICollectionViewCell {
	//MARK: 인터페이스 빌더
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
