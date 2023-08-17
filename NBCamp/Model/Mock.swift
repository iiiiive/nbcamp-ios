//
//  Mock.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-16.
//

import Foundation

struct MockManager {
	static let shared = MockManager()
	
	private init() {}
	
	var mock: [Board] = []
}

struct Board {}

struct Post {
	let title: String
	let content: String
	let username: String
	var comments: Int
	var likes: Int
	var imageurl: String?
	
	init(title: String, content: String, username: String, comments: Int, likes: Int, imageurl: String? = nil) {
		self.title = title
		self.content = content
		self.username = username
		self.comments = comments
		self.likes = likes
		self.imageurl = imageurl
	}
}

struct Paper {}
