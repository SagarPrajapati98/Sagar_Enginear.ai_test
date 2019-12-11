//
//  UserController.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation


class UserController {
    
    static public func getuserwith(offset:Int,complition:@escaping(_ hasemore:Bool,_ users:[Users]) -> Void){
        NSRequestManager.requestwithGET(with: API.getusers(offset: offset, limit: 10)) { (status, responsedata, message) in
            
            if status{
                do{
                    let usersresponse = try JSONDecoder().decode(UserResponse.self, from: responsedata);
                    if let users = usersresponse.data?.users{
                        complition(usersresponse.data?.has_more ?? false,users);
                    }else{
                        complition(false,[]);
                    }
                    
                }catch{
                    print("Error getting users list \(error.localizedDescription)");
                }
            }else{
                complition(false,[]);
            }
        }
    }
    static public func getuserimage(user:Users,image:@escaping(_ image:Data) -> Void){
        NSRequestManager.downloadimage(url: user.image ?? "") { (status, resimage) in
            if status{
                image(resimage)
            }
        }
    }
}
