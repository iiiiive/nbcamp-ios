//
//  EditViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-19.
//  Edited by Yujin Kim on 2023-08-20.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var userimageView: UIImageView!
	@IBOutlet weak var userimageChangeButton: UIButton!
	@IBAction func changeImage(_ sender: UIButton) {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.sourceType = .photoLibrary
		self.present(imagePicker, animated: true, completion: nil)
	}
	@IBAction func changeUser(_ sender: Any) {
		let alertController = UIAlertController(title: "알림", message: "수정하시겠습니까?", preferredStyle: .alert)
		let confirm = UIAlertAction(title: "확인", style: .default) { _ in
			var user = MockManager.shared.user
			let username = self.usernameTextField.text
			let uiimage = self.userimageView.image
			print("내 정보 수정: \(String(describing: username?.description))")
			user.username = username ?? "김르탄"
			user.userimage = uiimage
			MockManager.shared.user = user
			self.navigationController?.popViewController(animated: true)
		}
		let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
		alertController.addAction(confirm)
		alertController.addAction(cancel)
		present(alertController, animated: true, completion: nil)
	}
	
	let user: User = MockManager.shared.user
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "내 정보 수정"
		EditViewDecorator.run(viewController: self, user)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let selected = info[.originalImage] as? UIImage {
			userimageView.image = selected
			print("Selected Image: \(selected)")
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}

class EditViewDecorator {
	static func run(viewController: EditViewController, _ user: User) {
		decorateUserImageChangeButton(viewController)
		decorateUserImagePreviewImage(viewController, user)
		decorateUsername(viewController, user)
	}
	
	private static func decorateUserImageChangeButton(_ viewController: EditViewController) {
		let cb = viewController.userimageChangeButton
		cb?.layer.cornerRadius = CGFloat(0.0)
		cb?.layer.borderWidth = CGFloat(1.0)
		cb?.backgroundColor = ColorManager.nbcSurfaceColor
		cb?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
	}
	
	private static func decorateUsername(_ viewController: EditViewController, _ user: User) {
		let user = MockManager.shared.user
		let ut = viewController.usernameTextField
		ut?.placeholder = user.username
	}
	
	private static func decorateUserImagePreviewImage(_ viewController: EditViewController, _ user: User) {
		let user = MockManager.shared.user
		let uv = viewController.userimageView
		uv?.image = user.userimage
		uv?.layer.cornerRadius = CGFloat(0.0)
		uv?.layer.borderWidth = CGFloat(1.0)
		uv?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
	}
}
