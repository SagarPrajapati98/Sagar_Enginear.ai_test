//
//  LayoutView.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

@IBDesignable
class LayoutView: UIView {

    @IBInspectable var corderRadius:CGFloat = 0.0{
    
        didSet{
            self.layer.cornerRadius = self.corderRadius;
            self.clipsToBounds = self.corderRadius > 0;
        }
    }
    

}
