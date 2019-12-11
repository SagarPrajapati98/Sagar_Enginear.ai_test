//
//  HomeViewController.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var tableuserlist:UITableView!
    @IBOutlet private weak var loadingview:UIView!
    
    
    private var userlisting:[Users] = []
    private var hasemore:Bool = false
    // MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.setupUIElements()
        self.getuserlist()
    }
    
    //MARK: - USERFULL METHODS
    
    private func setupUIElements(){
        self.tableuserlist.tableFooterView = self.loadingview
    }
    private func getuserlist(with offset:Int = 0){
        
        UserController.getuserwith(offset: offset) { (hasemore, users) in
            
            for user in users{
                self.userlisting.append(user)
            }
            self.hasemore = hasemore;
            self.tableuserlist.reloadData();
            if !self.hasemore{
                self.tableuserlist.tableFooterView = nil
            }
        }// 
        
    }
}
extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CellUser.share;
        cell.userdetails(with: self.userlisting[indexPath.row]);
        if self.hasemore && indexPath.row == self.userlisting.count - 1{
            self.getuserlist(with: self.userlisting.count);
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userlisting.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let arrayitems = self.userlisting[indexPath.row].items
        if arrayitems!.count % 2 == 0{
            let height = (arrayitems!.count / 2) * Int(tableView.frame.width / 2)
            return CGFloat(height + 60)
            
        }else{
            let height = (arrayitems!.count / 2) * Int(tableView.frame.width / 2)
            return CGFloat(height + 60) + tableView.frame.width
        }
    }
}
