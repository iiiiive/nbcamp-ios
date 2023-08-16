//
//  CommunityViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class CommunityViewController: UIViewController {
    
    
    @IBOutlet weak var boardTable: UITableView!

    let formatter: DateFormatter = {
           let f = DateFormatter()
           f.dateStyle = .long
           f.timeStyle = .short
           return f
       }()
       

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        boardTable.delegate = self
        boardTable.dataSource = self
    }
    
    private func setTitle() {
        title = "커뮤니티"
    }
}

extension CommunityViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Board.dummyBoardList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boardCell = tableView.dequeueReusableCell(withIdentifier: "boardCell", for: indexPath)
              
              let target = Board.dummyBoardList[indexPath.row]
              boardCell.textLabel?.text = target.content
              boardCell.detailTextLabel?.text = formatter.string(from: target.insertDate)
              
              return boardCell
    }
}





