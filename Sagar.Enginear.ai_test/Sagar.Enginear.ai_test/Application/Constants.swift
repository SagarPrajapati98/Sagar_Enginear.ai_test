//
//  Constants.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation

let BASEURL:String = "https://sd2-hiring.herokuapp.com/api"

struct API {
    
    static func getusers(offset:Int,limit:Int)->String{
        return BASEURL+"/users?offset=\(offset)&limit=\(limit)"
    }
}
