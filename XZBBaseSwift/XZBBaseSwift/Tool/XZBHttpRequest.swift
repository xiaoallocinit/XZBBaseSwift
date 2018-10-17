//
//  XZBHttpRequest.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/17.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

class XZBHttpRequest: NSObject {
    //static let shared = XZBHttpRequest()
}
//
//MARK:-  2.0版本首页
//
extension XZBHttpRequest {
    
    static func APPCheckURL(
        success   : @escaping (_ json : Any?)->Void,
        failure   : @escaping (_ error : Error)->Void){
        
        
        let urlStr = ""
       
        XZBHttpTool.getRequest(urlPath: urlStr, parameters: nil, success: { (json) in
            XZBLog(json)
        }) { (error) in
            failure(error)
        }
        
        
        
    }
}
