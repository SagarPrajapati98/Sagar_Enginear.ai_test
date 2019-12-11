//
//  NSRequestManager.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation
import Alamofire


struct HttpRequest {
    var url:String
    var method:HTTPMethod
    var headers:HTTPHeaders
    var parameters:[String:Any]
}

class NSRequestManager {
    
    
    static public func requestwithGET(with url:String,complition:@escaping(_ status:Bool,_ resultdata:Data,_ message:String) -> Void){
        let req = self.createbody(url: url, method: .get, paramters: [:], headers: self.basicheader)
        self.sendrequest(request: req) { (status, responsedata, message) in
            complition(status,responsedata,message);
        }
        
    }
    static private func sendrequest(request:HttpRequest,complition:@escaping(_ status:Bool,_ result:Data,_ message:String) -> Void){
        
        Alamofire.request(request.url, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: request.headers).responseData { (response) in
            
            DispatchQueue.main.async {
            
                switch response.result{
                case .success:
                    let resposenstr = String(data: response.result.value!, encoding: String.Encoding.utf8);
//                    print(resposenstr!);
                    complition(true,response.result.value ?? Data(),"");
                    break;
                    
                case .failure:
                    complition(false,Data(),response.result.error?.localizedDescription ?? "");
                    break;
                }
            }
            
        }
    }
    static private var basicheader:[String:String]{
        let headers = ["Content-Type":"application/json","Accept":"application/json"];
        return headers;
    }
    static private func createbody(url:String,method:HTTPMethod,paramters:[String:Any],headers:HTTPHeaders) -> HttpRequest{
        let request = HttpRequest(url: url, method: method, headers: headers , parameters: paramters);
        return request
        
    }
    static public func downloadimage(url:String,complition:@escaping(_ status:Bool,_ image:Data) -> Void){
        Alamofire.request(url).responseData { (image) in
            
            DispatchQueue.main.async {
                switch image.result{
                case .success:
                    complition(true,image.result.value ?? Data())
                    break;
                    
                case .failure:
                    complition(false,Data())
                    break;
                }
            }
            
        }
    }
}
