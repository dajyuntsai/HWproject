//
//  DetailTableViewCell.swift
//  HWproject
//
//  Created by Hueijyun  on 2020/4/26.
//  Copyright © 2020 Hueijyun . All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet var TitleLabel: UILabel!
    
    @IBOutlet var ContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
