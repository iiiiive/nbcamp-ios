//
//  post.swift
//  NBCamp
//
//  Created by Hyunwoo Lee on 2023/08/16.
//

import Foundation


struct Post {
    let title: String
    let content: String
    let username: String
    
    
    var insertDate: Date
    
    init(content: String, title: String, username: String) {
        self.title = title
        self.content = content
        self.username = username
     
        insertDate = Date()
    }
    static var dummyBoardList = [
        Post(content: "내용", title: "제목", username: "작성자")
    ]
}
