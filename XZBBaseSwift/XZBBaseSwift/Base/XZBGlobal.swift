//
//  XZBGlobal.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit
import Kingfisher

//MARK: print
let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height
let isIPhoneX = (ScreenW == 375 && ScreenH == 812 || ScreenW == 414 && ScreenH == 896  ? true : false)
let statusBarH  = (isIPhoneX ? UIApplication.shared.statusBarFrame.height : 0)
let SafeBottomMargin : CGFloat = (isIPhoneX ? 34 : 0)
let ScreenScale = ScreenW/ScreenH
let placeImg = UIImage.init(named: "placeImg")


//MARK: Color
let XZBColorTheme       = UIColor.colorWithHex(hex: 0xffe500)
let XZBColorBackGround      = UIColor.colorWithHex(hex: 0xFFFFFF)
let XZBColorTitle   = UIColor.colorWithHex(hex: 0x333333)
let XZBColorNavigationBar   = UIColor.colorWithHex(hex: 0x333333)

//MARK: BaseUrl
enum NetworkError: Int {
    case HttpResquestFailed = -1000,UrlResourceFailed = -2000
}

let NetworkDomain:String = "com.XZBBase.Swift"

let BaseUrl : String =  ""

/** 当前版本 */
let CurrentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String




//MARK: print
func XZBLog<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):funciton:\(function):line:\(lineNumber)]- \(message)")
    #endif
}
//MARK: Kingfisher
extension Kingfisher where Base: ImageView {
    @discardableResult
    public func setImage(urlString: String?, placeholder: Placeholder? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
        return setImage(with: URL(string: urlString ?? ""),
                        placeholder: placeholder,
                        options:[.transition(.fade(0.5))])
    }
}

extension Kingfisher where Base: UIButton {
    @discardableResult
    public func setImage(urlString: String?, for state: UIControl.State, placeholder: UIImage? = UIImage(named: "normal_placeholder_h")) -> RetrieveImageTask {
        return setImage(with: URL(string: urlString ?? ""),
                        for: state,
                        placeholder: placeholder,
                        options: [.transition(.fade(0.5))])
        
    }
}


var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}
