//
//  XZBUIFontExtension.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit


let Font_8 = UIFont.systemFont(ofSize: 8)
let Font_10 = UIFont.systemFont(ofSize: 10)
let Font_11 = UIFont.systemFont(ofSize: 11)
let Font_12 = UIFont.systemFont(ofSize: 12)
let Font_13 = UIFont.systemFont(ofSize: 13)
let Font_14 = UIFont.systemFont(ofSize: 14)
let Font_15 = UIFont.systemFont(ofSize: 15)
let Font_16 = UIFont.systemFont(ofSize: 16)
let Font_17 = UIFont.systemFont(ofSize: 17)
let Font_18 = UIFont.systemFont(ofSize: 18)
let Font_19 = UIFont.systemFont(ofSize: 19)
let Font_20 = UIFont.systemFont(ofSize: 20)
let Font_21 = UIFont.systemFont(ofSize: 21)
let Font_22 = UIFont.systemFont(ofSize: 22)
let Font_23 = UIFont.systemFont(ofSize: 23)
let Font_24 = UIFont.systemFont(ofSize: 24)
let Font_25 = UIFont.systemFont(ofSize: 25)

let Font_Bold_10 = UIFont.boldSystemFont(ofSize: 10)
let Font_Bold_11 = UIFont.boldSystemFont(ofSize: 11)
let Font_Bold_12 = UIFont.boldSystemFont(ofSize: 12)
let Font_Bold_13 = UIFont.boldSystemFont(ofSize: 13)
let Font_Bold_14 = UIFont.boldSystemFont(ofSize: 14)
let Font_Bold_15 = UIFont.boldSystemFont(ofSize: 15)
let Font_Bold_16 = UIFont.boldSystemFont(ofSize: 16)
let Font_Bold_17 = UIFont.boldSystemFont(ofSize: 17)
let Font_Bold_18 = UIFont.boldSystemFont(ofSize: 18)
let Font_Bold_19 = UIFont.boldSystemFont(ofSize: 19)
let Font_Bold_20 = UIFont.boldSystemFont(ofSize: 20)
let Font_Bold_21 = UIFont.boldSystemFont(ofSize: 21)
let Font_Bold_22 = UIFont.boldSystemFont(ofSize: 22)
let Font_Bold_23 = UIFont.boldSystemFont(ofSize: 23)
let Font_Bold_24 = UIFont.boldSystemFont(ofSize: 24)
let Font_Bold_26 = UIFont.boldSystemFont(ofSize: 26)
let Font_Bold_25 = UIFont.boldSystemFont(ofSize: 25)

extension UIFont {
    public class func pingFangMediumFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFang-SC-Medium", size: size) ?? UIFont.init()
    }
    
    public class func pingFangTextFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFang-SC-Regular", size: size) ?? UIFont.init()
    }
    public class func pingFangBoldFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFang-SC-Bold", size: size) ?? UIFont.init()
    }
    public class func pingFangHeavyFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFang-SC-Heavy", size: size) ?? UIFont.init()
    }
    public class func AppleGothicFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "AppleGothic", size: size) ?? UIFont.init()
    }
    public class func HelveticaNeueFont(size: CGFloat) -> UIFont {
        return UIFont.init(name: "HelveticaNeue-Light", size: size) ?? UIFont.init()
    }
    
}
