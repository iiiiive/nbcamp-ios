//
//  boardCell.swift
//  NBCamp
//
//  Created by Hyunwoo Lee on 2023/08/16.
//

import UIKit

class boardCell: UITableViewCell {

    
    
    @IBOutlet weak var boardTitle: UILabel!
    
    @IBOutlet weak var boradSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
