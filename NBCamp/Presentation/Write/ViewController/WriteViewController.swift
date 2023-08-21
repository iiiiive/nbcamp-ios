//
//  WriteViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var contentTextField: UITextField!
	@IBOutlet weak var previewImage: UIImageView!
	
	@IBAction func selectImage(_ sender: UIButton) {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.sourceType = .photoLibrary
		self.present(imagePicker, animated: true, completion: nil)
	}
	@IBAction func submit(_ sender: UIButton) {
		let alertController = UIAlertController(title: "알림", message: "작성한 글을 게시판에 등록할까요?", preferredStyle: .alert)
		let confirm = UIAlertAction(title: "확인", style: .default) { _ in
			let user = MockManager.shared.user
			let new = Post(id: MockManager.shared.defaultList.count + 1, likes: 0, title: self.titleTextField.text ?? "", content: self.contentTextField.text ?? "",username: user.username, date: DateTimeFormatter.createDateTime(), addimage: self.previewImage.image)
			MockManager.shared.defaultList.insert(new, at: 0)
			MockManager.shared.user.userpost.insert(new, at: 0)
			print("사용자 데이터\(user.userpost)\n자유게시판 데이터\(MockManager.shared.defaultList)")
			self.navigationController?.popViewController(animated: true)
		}
		let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
		alertController.addAction(confirm)
		alertController.addAction(cancel)
		present(alertController, animated: true, completion: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		WriteViewDecorator.run(writeViewController: self)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let selected = info[.originalImage] as? UIImage {
			previewImage.image = selected
			print("Selected Image: \(selected)")
		}
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}

class WriteViewDecorator {
	static func run(writeViewController: WriteViewController) {
		decorateTextField(writeViewController)
	}
	
	private static func decorateTextField(_ writeViewController: WriteViewController) {
		writeViewController.titleTextField.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		writeViewController.contentTextField.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		writeViewController.titleTextField.layer.borderWidth = CGFloat(1.0)
		writeViewController.contentTextField.layer.borderWidth = CGFloat(1.0)
		writeViewController.titleTextField.layer.cornerRadius = 10.0
		writeViewController.contentTextField.layer.cornerRadius = 10.0
	}
}
