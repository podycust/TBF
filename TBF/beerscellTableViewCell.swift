//
//  beerscellTableViewCell.swift
//  TBF
//
//  Created by Asa Bowes on 27/08/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit

class beerscellTableViewCell: UITableViewCell {
//MARK: Properties
    @IBOutlet weak var beerimage: UIImageView!
    @IBOutlet weak var beername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
