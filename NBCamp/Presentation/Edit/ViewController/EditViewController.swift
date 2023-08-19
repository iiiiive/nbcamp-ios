//
//  EditViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-19.
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "내 정보 수정"
		setUsernamePlaceHolder()
		setUserImagePreviewImage()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	private func setUsernamePlaceHolder() {
		let user = MockManager.shared.user
		usernameTextField.placeholder = user.username
	}
	
	private func setUserImagePreviewImage() {
		let user = MockManager.shared.user
		userimageView.image = user.userimage
		userimageView.layer.cornerRadius = CGFloat(0.0)
		userimageView.layer.borderWidth = CGFloat(1.0)
		userimageView.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
	}
	
	private func setUserImageChangeButton() {
		let cb = userimageChangeButton
		cb?.layer.cornerRadius = CGFloat(0.0)
		cb?.layer.borderWidth = CGFloat(1.0)
		cb?.backgroundColor = ColorManager.nbcSurfaceColor
		cb?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
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

//MARK: 내 정보 수정 뷰 데코레이터
class EditViewDecorator {}
