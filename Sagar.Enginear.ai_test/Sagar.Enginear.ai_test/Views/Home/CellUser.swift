//
//  CellUser.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

class CellUser: UITableViewCell {

    
    static var share:CellUser{
        return UINib(nibName: "CellUser", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! CellUser
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
