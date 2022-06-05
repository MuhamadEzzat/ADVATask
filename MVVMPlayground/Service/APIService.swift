//
//  APIService.swift
//  MVVMPlayground
//
//  Created by Mohamed Ezzat on 6/3/22.
//
import Foundation
import Alamofire

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->() )
}

class APIService: APIServiceProtocol {
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError?)->()) {
        DispatchQueue.global().async {
            sleep(3)
            let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
            APIManager.sharedInstance.getRequest(url!) { res in
                let decoder = JSONDecoder()
                do{
                    let photos = try decoder.decode([Photo].self, from: res.data!)
                    complete(true, photos, nil)
                }catch{
                    print(res.error?.localizedDescription)
                }
                
            }
        }
    }
}







