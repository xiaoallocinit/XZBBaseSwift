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

 



class XZBHttpTool: NSObject {
    private static let reachabilityManager = { () -> NetworkReachabilityManager in
        let manager = NetworkReachabilityManager.init()
        return manager!
    }()
   
    private static let sessionManager = { () -> SessionManager in
        let manager = SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 15
        return manager
    }()
    
    
    
    
}

extension XZBHttpTool {
    static func processData(data:[String:Any], success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let code:Int = data["code"] as! Int
        if(code == 0) {
            success(data)
             XZBLog(data)
        }else {
            let message:String = data["msg"] as! String
            let error = NSError.init(domain: NetworkDomain, code: NetworkError.HttpResquestFailed.rawValue, userInfo: [NSLocalizedDescriptionKey : message])
            XZBLog(error)
            failure(error)
        }
    }
    //MARK:-  get 请求
    static func getRequest(urlPath:String,  parameters : [String:Any]?, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let contentTypes: Set = ["application/json", "text/json", "text/plain","text/html", "text/javascript"]
       
       let head = ["USER_INFO_KEY":"d26c3eff74a8095b3f6ebc17bee6cbac","version":CurrentVersion,"source":"ios"]

        sessionManager.request(urlPath, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default, headers: head)
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
    
    //MARK:-  post请求
    static func postRequest(urlPath:String,  parameters : [String:Any]?, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let contentTypes: Set = ["application/json", "text/json", "text/plain","text/html", "text/javascript"]
         let head = ["d26c3eff74a8095b3f6ebc17bee6cbac":"USER_INFO_KEY","v4.2":"version","ios":"source"]
       
        
        sessionManager.request(urlPath, method: HTTPMethod.post, parameters: parameters, encoding: URLEncoding.default, headers: head)
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
    //MARK:-  获取head头部key请求
    static func getHeadRequest(urlPath:String,  parameters : [String:Any]?, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
        let contentTypes: Set = ["application/json", "text/json", "text/plain","text/html", "text/javascript"]
        sessionManager.request(urlPath, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: contentTypes)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    
                    let dic = response.response?.allHeaderFields as! [String:Any]
                    XZBLog(dic)
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
    //MARK:-  upload上传请求
    
    static func uploadRequest(urlPath:String, data:Data,parameters : [String:Any]?, progress:@escaping UploadProgress, success:@escaping HttpSuccess, failure:@escaping HttpFailure) {
       
        sessionManager.upload(multipartFormData: { multipartFormData in
            for (key,value) in parameters! {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            multipartFormData.append(data, withName: "file", fileName: "file", mimeType: "multipart/form-data")
        }, usingThreshold: UInt64.init(), to: BaseUrl + urlPath,
           method: HTTPMethod.post,
           headers: nil,
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


//Reachability Extension
extension XZBHttpTool {
    static func startMonitoring() {
        reachabilityManager.startListening()
        reachabilityManager.listener = { status in
            NotificationCenter.default.post(name:Notification.Name(rawValue: NetworkStatesChangeNotification), object: status)
        }
    }
    
    static func networkStatus() ->NetworkReachabilityManager.NetworkReachabilityStatus {
        return reachabilityManager.networkReachabilityStatus
    }
    
    static func isNotReachableStatus(status:Any?) -> Bool {
        let netStatus = status as! NetworkReachabilityManager.NetworkReachabilityStatus
        return netStatus == .notReachable
    }
}
