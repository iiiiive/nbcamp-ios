//
//  User.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-16.
//

import Foundation

/// 앱 디버깅에 사용하는 사용자 구조체입니다.
struct User {
	var username: String
	//TODO: 프로필 이미지
	//TODO: 작성한 글 목록
	//TODO: 댓글 목록
	
	init(username: String = "김르탄") {
		self.username = username
	}
}
