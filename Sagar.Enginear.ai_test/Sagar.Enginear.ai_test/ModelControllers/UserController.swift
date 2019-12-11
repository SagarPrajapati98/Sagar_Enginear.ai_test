//
//  UserController.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation


class UserController {
    
    static public func getuserwith(offset:Int,complition:@escaping(_ hasemore:Bool) -> Void){
        NSRequestManager.requestwithGET(with: API.getusers(offset: offset, limit: 10)) { (status, responsedata, message) in
            
            if status{
                
            }
        }
    }
}
