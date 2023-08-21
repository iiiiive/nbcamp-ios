//
//  Post.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-17.
//

import Foundation
import UIKit

struct Post {
	let id: Int
	var likes: Int
	let username: String
	let title: String
	let content: String
	var date: String
	var image: String?
	var uiimage: UIImage?
	
	init(id: Int, likes: Int, title: String, content: String, username: String, date: String,
		 image: String? = "", addimage: UIImage? = UIImage(named: "default_image.png")) {
		self.id = id
		self.likes = likes
		self.username = username
		self.title = title
		self.content = content
		self.date = date
		self.image = image
		self.uiimage = addimage
	}
}
