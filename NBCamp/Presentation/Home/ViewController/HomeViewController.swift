//
//  HomeViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//  Edited by Youngkun Choi on 2023-08-17.
//  Edited by Yujin Kim on 2023-08-20.
//

import SafariServices
import UIKit

class HomeViewController: UIViewController, SFSafariViewControllerDelegate {
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var avatar: UIImageView!
	@IBOutlet weak var banner: UIImageView!
	@IBOutlet weak var firstExternalLinkButton: UIButton!
	@IBOutlet weak var secondExternalLinkButton: UIButton!
	@IBOutlet weak var thirdExternalButton: UIButton!
	
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
		HomeDecorator.run(homeViewController: self)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		HomeDecorator.run(homeViewController: self)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		dismiss(animated: true, completion: nil)
	}
}

class HomeDecorator {
	static func run(homeViewController: HomeViewController) {
		decorateTitle(homeViewController)
		decorateAvatar(homeViewController)
		decorateUsername(homeViewController)
		decorateBanner(homeViewController)
		decorateSafariBrowsingButton(homeViewController)
	}
	
	private static func decorateTitle(_ homeViewController: HomeViewController) {
		homeViewController.title = "홈"
	}
	
	private static func decorateAvatar(_ homeViewController: HomeViewController) {
		let user = MockManager.shared.user
		homeViewController.avatar.image = user.userimage
		homeViewController.avatar.layer.cornerRadius = CGFloat(25.0)
		homeViewController.avatar.layer.borderWidth = CGFloat(2.0)
		homeViewController.avatar.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
	}
	
	private static func decorateUsername(_ homeViewController: HomeViewController) {
		let user = MockManager.shared.user
		homeViewController.usernameLabel.text = user.username + "님, 환영해요!"
	}
	
	private static func decorateBanner(_ homeViewController: HomeViewController) {
		homeViewController.banner.layer.cornerRadius = CGFloat(10.0)
	}
	
	private static func decorateSafariBrowsingButton(_ homeViewController: HomeViewController) {
		let feb = homeViewController.firstExternalLinkButton
		let seb = homeViewController.secondExternalLinkButton
		let teb = homeViewController.thirdExternalButton
		feb?.layer.cornerRadius = CGFloat(10.0)
		seb?.layer.cornerRadius = CGFloat(10.0)
		teb?.layer.cornerRadius = CGFloat(10.0)
		feb?.layer.borderWidth = CGFloat(2.0)
		seb?.layer.borderWidth = CGFloat(2.0)
		teb?.layer.borderWidth = CGFloat(2.0)
		feb?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		seb?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		teb?.layer.borderColor = ColorManager.nbcTertiaryColor?.cgColor
		feb?.backgroundColor = ColorManager.nbcSurfaceColor
		seb?.backgroundColor = ColorManager.nbcSurfaceColor
		teb?.backgroundColor = ColorManager.nbcSurfaceColor
	}
}
