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
	
	var defaultList: [Post] = [
		Post(id: 1, likes: 0, title: "나방캠 가입 인증이요", content: "오늘 처음 들어와봤는데 재밌는 글 많네요.",
			 username: "김유진", date: "08. 19 12:34", image: nil),
		Post(id: 2, likes: 0, title: "빠르게 링크 타서 들어가고 싶으신가요?", content: "그럼 홈으로 돌아가서 버튼 눌러보세요.",
			 username: "최영군", date: "08. 18 12:34", image: nil),
		Post(id: 3, likes: 0, title: "콜렉션 뷰 너무 다루기 어려운 것 같아요", content: "콜렉션뷰의 셀들이 가운데로 몰리는 현상 때문에 어쩔 수 없이 오토레이아웃에 대해서 빡공을 하게 되었네요.",
			 username: "이현우", date: "08. 18 12:34", image: nil),
		Post(id: 4, likes: 0, title: "스토리보드를 뽀개보자!", content: "일단 스토리보드라는 것을 한번 다뤄보았는데요. 나름 할만 했던 것 같아요.",
			 username: "이애라", date: "08. 17 12:34", image: nil),
		Post(id: 5, likes: 0, title: "타이머 기능에 대해서 혹시 아시나요?", content: "왜 저희 내배캠 출석할 때 타이머 작동하잖아여 그걸 제가 한번 만들어 봤어요.",
			 username: "김서진", date: "08. 17 12:34", image: nil),
	]
}
