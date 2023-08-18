//
//  HomeViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import SafariServices
import UIKit

class HomeViewController: UIViewController, SFSafariViewControllerDelegate {
	///MARK: 인터페이스 빌더
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var banner: UIImageView!
	@IBOutlet weak var firstExternalLinkButton: UIButton!
	@IBOutlet weak var secondExternalLinkButton: UIButton!
	@IBOutlet weak var thirdExternalButton: UIButton!
	
	@IBAction func selectAvatar(_ sender: UIButton) {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.sourceType = .photoLibrary
		self.present(imagePicker, animated: true, completion: nil)
	}
	
	
	@IBAction func goToFirstPage(_ sender: UIButton) {
		let url: URL = URL(string: "https://teamsparta.notion.site/06897c48955043189378c855d902223b?pvs=4")!
		let safariViewController = SFSafariViewController(url: url)
		safariViewController.delegate = self
		present(safariViewController, animated: true, completion: nil)
	}
	
	@IBAction func goToSecondPage(_ sender: UIButton) {
		let url: URL = URL(string: "https://teamsparta.notion.site/iOS-7-docs-11d6a99b205142bb8020137d15f716c2")!
		let safariViewController = SFSafariViewController(url: url)
		safariViewController.delegate = self
		present(safariViewController, animated: true, completion: nil)
	}
	
	@IBAction func goToThirdPage(_ sender: UIButton) {
		let url: URL = URL(string: "https://app.gather.town/app/TxURMan5xPdtZZWY/nbcamp-iOS-A")!
		let safariViewController = SFSafariViewController(url: url)
		safariViewController.delegate = self
		present(safariViewController, animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = ColorManager.nbcBackgroundColor
		setHomeViewContent()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	private func setHomeViewContent() {
		setTitle()
		setAvatar()
		setUsername()
		setBanner()
		setButton()
	}
	
	private func setTitle() {
		title = "홈"
	}
	
	private func setAvatar() {
		avatar.layer.cornerRadius = CGFloat(25.0)
		avatar.layer.borderWidth = CGFloat(1.0)
		avatar.layer.borderColor = ColorManager.nbcSurfaceColor?.cgColor
	}
	
	private func setUsername() {
		let user = User()
		usernameLabel.text = user.username + "님, 환영해요!"
	}
	
	private func setBanner() {
		banner.layer.cornerRadius = CGFloat(10.0)
	}
	
	private func setButton() {
		firstExternalLinkButton.layer.borderWidth = 0
		firstExternalLinkButton.backgroundColor = ColorManager.nbcSurfaceColor
		secondExternalLinkButton.backgroundColor = ColorManager.nbcSurfaceColor
		thirdExternalButton.backgroundColor = ColorManager.nbcSurfaceColor
	}
	
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		dismiss(animated: true, completion: nil)
	}
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let selected = info[.originalImage] as? UIImage {
			avatar.image = selected
		}
	}
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}
