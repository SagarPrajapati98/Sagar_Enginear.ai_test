//
//  CellItem.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit
import SDWebImage

class CellItem: UICollectionViewCell {

    @IBOutlet private weak var imageitem:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func setitemimage(image:String){
        self.imageitem.sd_setImage(with: URL(string: image)!) { (image, error, type, url) in
            
        }
    }

}
