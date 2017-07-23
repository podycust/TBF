//
//  BeerTable.swift
//  TBF
//
//  Created by Asa Bowes on 17/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit

class BeerTable: UITableViewCell {

    @IBOutlet weak var BeerImage: UIImageView!
    @IBOutlet weak var BeerName: UILabel!
    @IBOutlet weak var BeerPrice: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
