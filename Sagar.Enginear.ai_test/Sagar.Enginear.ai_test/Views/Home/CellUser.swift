//
//  CellUser.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

class CellUser: UITableViewCell {

    @IBOutlet private weak var labelusername:UILabel!
    @IBOutlet private weak var userimage:UIImageView!
    
    @IBOutlet private weak var imageitems:UICollectionView!
    @IBOutlet private weak var imageitemsheight:NSLayoutConstraint!
    
    private var items:[String] = []
    
    static var share:CellUser{
        return UINib(nibName: "CellUser", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! CellUser
    }
    
    public func userdetails(with user:Users){
        self.labelusername.text = user.name ?? "No Name"
        if let userimaguser = user.image{
            self.userimage.sd_setImage(with: URL(string: userimaguser)!) { (image, error, type, url) in
                
            }
        }
        
        self.items = user.items ?? []
        self.imageitems.reloadData()
//        if self.items.count % 2 != 0{
//            self.imageitemsheight.constant =  self.imageitems.frame.height * CGFloat(self.items.count)
//        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imageitems.register(UINib(nibName: "CellItem", bundle: nil), forCellWithReuseIdentifier: "items")
        self.imageitems.dataSource = self;
        self.imageitems.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CellUser:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "items", for: indexPath) as! CellItem;
        cell.setitemimage(image: self.items[indexPath.row]);
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.numberOfItems(inSection: 0) % 2 == 0 {
            return CGSize(width: (self.imageitems.frame.size.width - 5) / 2, height: (self.imageitems.frame.size.width - 5) / 2)
        }
        let remaider = (Double(indexPath.item)/3).truncatingRemainder(dividingBy: 1)
        if remaider == 0 {
            return CGSize(width: self.imageitems.frame.size.width, height:  self.imageitems.frame.size.width)
        }
        return CGSize(width: (collectionView.frame.size.width - 5) / 2, height: (collectionView.frame.size.width - 5) / 2)
        
    }
}
