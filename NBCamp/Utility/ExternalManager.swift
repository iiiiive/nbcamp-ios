//
//  ExternalManager.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-17.
//

import Foundation
import SafariServices

class ExternalManager {
	static func open(_ url: String) {
		guard let url = URL(string: url) else { return }
		if UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
}
