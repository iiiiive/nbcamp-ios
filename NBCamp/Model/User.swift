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
	var userimage: UIImage?
	var userpost: [Post]
	
	init(username: String, userimage: UIImage?, userpost: [Post]) {
		self.username = username
		self.userimage = userimage
		self.userpost = userpost
	}
}
