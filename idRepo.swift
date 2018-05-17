//
//  Reposs.swift
//  TopListOfGitHub
//
//  Created by mac on 5/11/18.
//  Copyright © 2018 LyndeDev. All rights reserved.
//

import UIKit

class idRepo: UITableViewCell {

  //  @IBOutlet  var imglbl: UIImageView!
    
    @IBOutlet var stars: UILabel!
    @IBOutlet var lblowner: UILabel!
    @IBOutlet var avatar: UIImageView!
   @IBOutlet  var desclbl: UILabel!
    @IBOutlet  var namelbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
