//
//  CommunityViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class CommunityViewController: UIViewController {
    
    
    @IBOutlet weak var postCollection: UICollectionView!
    
    let formatter: DateFormatter = {
           let f = DateFormatter()
           f.dateStyle = .long
           f.timeStyle = .short
           return f
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        postCollection.delegate = self
        postCollection.dataSource = self
    }
    
    private func setTitle() {
        title = "커뮤니티"
        
    }
}

extension CommunityViewController: UICollectionViewDataSource, UICollectionViewDelegate {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Post.dummyBoardList.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! postViewCell

              let target = Post.dummyBoardList[indexPath.row]
     
        cell.labelTitle.text = target.title
        cell.labelContent.text = target.content
        cell.labelUsername.text = target.username

        
      
        //  postCell.Label.Title?.text = target.content
        // postCell.detailTextLabel?.text = formatter.string(from: target.insertDate)

              return cell
    }
}





