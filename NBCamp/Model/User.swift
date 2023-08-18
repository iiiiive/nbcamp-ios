//
//  User.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-16.
//

import Foundation
import UIKit

struct User {
	var username: String
	var image: UIImage?
	//TODO: 작성한 글 목록
	
	init(username: String = "김르탄", userprofile: UIImage? = UIImage(named: "kimrtan")) {
		self.username = username
		self.image = userprofile
	}
}
