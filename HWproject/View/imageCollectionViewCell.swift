//
//  imageCollectionViewCell.swift
//  HWproject
//
//  Created by Hueijyun  on 2020/4/24.
//  Copyright © 2020 Hueijyun . All rights reserved.
//

import UIKit

class imageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var colorImageView: UIImageView!

    @IBOutlet var idLabel: UILabel!
    
    @IBOutlet var titleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.colorImageView.image = nil
    }
    
}
