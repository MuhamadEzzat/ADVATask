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
//import Overlog
//import SwiftyJSON

class APIManager {
    //MARK: - Singlton
    class var sharedInstance : APIManager {
        struct Singlton {
            static let instance = APIManager()
        }
        
        return Singlton.instance
        
        
    }
    var header : [String: String]? = [:]
    
    // upload multi photos
//    func uploadArrayOfMultiPhoto(_ imagesData: [Data],_ parameters: [String : String],_ imageParamName: String,_ toUrl: String, vc: UIViewController) -> AFDataResponse<Any>? {
//        var res : AFDataResponse<Any>? = nil
//    AF.upload(multipartFormData: { multipartFormData in
//            // import image to request
//            for imageData in imagesData {
//                multipartFormData.append(imageData, withName: "\(imageParamName)[]", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
//            }
//            for (key, value) in parameters {
//
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            }
//        }, to: toUrl,
//
//           encodingCompletion: { encodingResult in
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//
//                    print("Done! upload_images ==>\(String.init(data: response.data!, encoding: String.Encoding.utf8))")
//                    res = response
//
//                    let decoder = JSONDecoder()
//                    do{
//                        let model = try decoder.decode(Fail_Base.self, from: (res?.data!)!)
//                        if model.status! == "failed"{
//                            SharedHandler.DisAppearMessage(viewController: vc, message: model.msg ?? "")
//
//                        }else{
//                            SharedHandler.DisAppearMessage(viewController: vc, message: model.msg ?? "")
////                            self.datasource = model
////                            print("model ==> \(self.datasource!)")
//                            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
//                            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tab") as! UITabBarController
//                            UIApplication.shared.keyWindow?.rootViewController = viewController
//
//                        }
//
//
//
//                    }catch{
//                        SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
//                    }
//
//                }
//            case .failure(let error):
//
//                print(error)
//            }
//
//        })
//        return res
//
//    }
    
    
    // MARK: - general request
    // Create a configuration.
    let configuration = URLSessionConfiguration.default

    
    func getRequest(_ url : String, header: HTTPHeaders, compeltionHandler : @escaping (DataResponse<Any>) -> Void) {
        
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
        compeltionHandler(response)
            
            
        }
        
//        // Enable HTTP traffic inspection.
//        Overlog.shared.enableHTTPTrafficDebugging(in: configuration)
//
//        // Create and normally use a session.
//        let session = URLSession(configuration: configuration)
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
//                    session.dataTask(with: .get(url: url)).resume()
//                }
    }
    
    func getRequest(_ url : URL ,completionHandler :@escaping (DataResponse<Any>) -> Void) {
        _ = Alamofire.request(url,method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            completionHandler(response)
        }
        
        
////         Enable HTTP traffic inspection.
//        Overlog.shared.enableHTTPTrafficDebugging(in: configuration)
//
//        // Create and normally use a session.
//        let session = URLSession(configuration: configuration)
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
//                    session.dataTask(with: .get(url: String(contentsOf: url))).resume()
//                }
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

    
//    func uploadWithImg(_ url: URL,_ para: [String:Any]?,_ img: UIImage,_ imgextention: String?,_ vc: UIViewController) {
//        var type = "png"
//        if imgextention == nil {
//            type = "png"
//        }else{
//            type = imgextention!
//        }
//    AF.upload( multipartFormData: { multipartFormData in
//                multipartFormData.append(img.jpegData(compressionQuality: 0.2)!, withName: "image", fileName: "\(UserDefaults.standard.integer(forKey: _ID)).\(type)", mimeType: "image/\(type)")
//        },
//            to: url){ (result) in
//
//                switch result {
//                case .success(let upload, _,_ ):
//
//                    upload.uploadProgress(closure: { (progress) in
//                        print("Upload Progress: \(progress.fractionCompleted)")
//                        if progress.fractionCompleted == 1.0 {
//                            print("===>>>upload photo completed")
//                           SharedHandler.alertDialogawithPopNavigationVC(vc, "","your data will be review from school", BtnTitle: "OK")
//
//                        }
//                    })
//
//                    upload.responseJSON { response in
//
//                        switch response.result {
//                        case .success( _) :
//                            let decoder = JSONDecoder()
//                            do{
////
//                                let model = try decoder.decode(State_Base.self, from: response.data!)
//                                self.state = model
//
//                                SharedHandler.alertDialogawithPopNavigationVC(vc, "", self.state?.state?[0].state ?? "", BtnTitle: "OK")
//
//                            }catch{
//                                SharedHandler.alertDialog2lang(vc, msgEg: "invalid data Parsing.", msgAr: "خطأ في تحويل البيانات.")
//                            }
//                        case .failure(let error):
//                            SharedHandler.alertDialogawithPopNavigationVC(vc, "", error.localizedDescription, BtnTitle: "OK")
//
//                                                    }
//                    }
//                case .failure(let error):
//                    SharedHandler.alertDialogawithPopNavigationVC(vc, "", error.localizedDescription, BtnTitle: "OK")
//
//                }
//        }
//    }
    
   }
        

        
  
    


