//
//  Mock.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-16.
//

import Foundation

/// 목업 데이터를 사용하기 위한 싱글톤 패턴 인스턴스입니다.
struct MockManager {
	static let shared = MockManager()
	
	private init() {}
	
	var postList: [Post] = [
		Post(id: 1, likes: 0, title: "파이썬", content: "파이썬 문법 재밌네요.",
			 username: "명세인", date: "08. 17 12:34", image: nil),
		Post(id: 1, likes: 0, title: "파이썬", content: "파이썬 문법 재밌네요.",
			 username: "명세인", date: "08. 17 12:34", image: nil),
		Post(id: 1, likes: 0, title: "파이썬", content: "파이썬 문법 재밌네요.",
			 username: "명세인", date: "08. 17 12:34", image: nil),
		Post(id: 1, likes: 0, title: "파이썬", content: "파이썬 문법 재밌네요.",
			 username: "명세인", date: "08. 17 12:34", image: nil),
		Post(id: 1, likes: 0, title: "파이썬", content: "파이썬 문법 재밌네요.",
			 username: "명세인", date: "08. 17 12:34", image: nil),
	]
}
