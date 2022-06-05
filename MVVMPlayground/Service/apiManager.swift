//
//  apiManager.swift
//  
//
//
//

import UIKit
//
//  apiManager.swift
//  adabBook
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 Madonna. All rights reserved.
//

import Foundation
import Alamofire


class APIManager {
    //MARK: - Singlton
    class var sharedInstance : APIManager {
        struct Singlton {
            static let instance = APIManager()
        }
        
        return Singlton.instance
        
        
    }
    var header : [String: String]? = [:]
    
    // MARK: - general request
    // Create a configuration.
    let configuration = URLSessionConfiguration.default

    
    func getRequest(_ url : String, header: HTTPHeaders, compeltionHandler : @escaping (DataResponse<Any>) -> Void) {
        
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
        compeltionHandler(response)
            
            
        }
        
    }
    
    func getRequest(_ url : URL ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
        
    }
    
    
    
    func postRequest(_ url : String , header: HTTPHeaders, Parameters : [String: Any]?,completionHandler :@escaping (DataResponse<Any>) -> Void) {
      
        _ = Alamofire.request(url,method: .post, parameters: Parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            completionHandler(response)
        }
    }
    
    func deleteRequest(_ url : String, header: HTTPHeaders, Parameters : [String: Any]?,completionHandler :@escaping (DataResponse<Any>) -> Void){
        
        _ = Alamofire.request(url, method: .delete, parameters: Parameters, encoding: JSONEncoding.default, headers: header).responseJSON(completionHandler: { response in
            print(response.response?.statusCode, "fdsfsdfs")
            completionHandler(response)
        })
        
    }

    }
