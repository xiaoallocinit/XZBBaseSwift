//
//  XZBHttpTool.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import Alamofire


let NetworkStatesChangeNotification:String = "NetworkStatesChangeNotification"

typealias UploadProgress = (_ percent:CGFloat) -> Void
typealias HttpSuccess = (_ data:Any) -> Void
typealias HttpFailure = (_ error:Error) -> Void

 let BaseUrl : String =  "https://yntest.zhuiyinanian.cn/api/"

class XZBHttpTool: NSObject {
   
    
    
    private static let reachabilityManager = { () -> NetworkReachabilityManager in
        let manager = NetworkReachabilityManager.init()
        return manager!
    }()
    private static let sessionManager = { () -> SessionManager in
        let manager = SessionManager.default
       
        return manager
    }()
}

//Http Method Extension
extension XZBHttpTool {
    static func processData(data:[String:Any], success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let code:Int = data["code"] as! Int
        if(code == 0) {
            success(data)
        }else {
            let message:String = data["message"] as! String
            
            failure(message as! Error)
        }
    }
    
    static func getRequest(urlPath:String,  parameters : NSMutableDictionary, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
         let contentTypes: Set = ["application/json", "text/json", "text/plain","text/html", "text/javascript"]
        
        let head = ["":"USER_INFO_KEY","":"version","ios":"source"]
        
        let url = BaseUrl + urlPath
        
        sessionManager.request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: contentTypes)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    let data:[String:Any] = response.result.value as! [String:Any]
                    processData(data: data, success: success, failure: failure)
                    break
                case .failure(let error):
                    let err:NSError = error as NSError
                    if(NetworkReachabilityManager.init()?.networkReachabilityStatus == .notReachable) {
                        failure(err)
                        return;
                    }
   
                }
            })
    }
    
    static func postRequest(urlPath:String,  parameters : NSMutableDictionary, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let contentTypes: Set = ["application/json", "text/json", "text/plain","text/html", "text/javascript"]
        
        let head = ["":"USER_INFO_KEY","":"version","ios":"source"]
        sessionManager.request(BaseUrl + urlPath, method: HTTPMethod.post, parameters: parameters, encoding: URLEncoding.default, headers: head)
            .validate(statusCode: 200..<300)
            .validate(contentType: contentTypes)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    let data:[String:Any] = response.result.value as! [String:Any]
                    processData(data: data, success: success, failure: failure)
                    break
                case .failure(let error):
                    let err:NSError = error as NSError
                    if(NetworkReachabilityManager.init()?.networkReachabilityStatus == .notReachable) {
                        failure(err)
                        return;
                    }
                    
                }
            })
    }
    
    
    static func uploadRequest(urlPath:String, data:Data, parameters : NSMutableDictionary, progress:@escaping UploadProgress, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
       let head = ["":"USER_INFO_KEY","":"version","ios":"source"]
        sessionManager.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters! {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            multipartFormData.append(data, withName: "file", fileName: "file", mimeType: "multipart/form-data")
        }, usingThreshold: UInt64.init(), to: BaseUrl + urlPath,
           method: HTTPMethod.post,
           headers: head,
           encodingCompletion: { encodingResult in
            switch(encodingResult) {
            case .success(let request, _, _):
                request.uploadProgress(closure: { uploadProgress in
                    progress(CGFloat(uploadProgress.completedUnitCount)/CGFloat(uploadProgress.totalUnitCount))
                }).responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        let data:[String:Any] = response.result.value as! [String:Any]
                        processData(data: data, success: success, failure: failure)
                        break
                    case .failure(let error):
                        let err:NSError = error as NSError
                        failure(err)
                        break
                    }
                })
                break
            case .failure(let error):
                let err:NSError = error as NSError
                failure(err)
                break
            }
        })
    }
}

