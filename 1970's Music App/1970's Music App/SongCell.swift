//
//  SongCell.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Artist: UILabel!
    @IBOutlet weak var Positon: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Title.font = UIFont.boldSystemFont(ofSize: 15.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        super.setSelected(selected, animated: animated)
    }

}
