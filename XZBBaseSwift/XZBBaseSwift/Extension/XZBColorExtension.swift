//
//  XZBColorExtension.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

extension UIColor {
    static func colorWithRGBA(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) -> UIColor{
        
        return self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    static func colorWithRGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor{
        
        return colorWithRGBA(r: r, g: g, b: b, alpha: 1)
    }
    
    static func colorWithHex(hex : Int) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1)
    }
    
    static func colorWithHex(hex : Int , alpha : CGFloat) -> UIColor{
        return UIColor.init(red: CGFloat((hex >> 16) & 0xFF)/255.0 , green: CGFloat((hex >> 8) & 0xFF)/255.0 , blue: CGFloat(hex & 0xFF)/255.0 , alpha: alpha)
    }
    
   static func randomColor() -> UIColor {
    return colorWithRGB(r: CGFloat(arc4random_uniform(256)),
                        g: CGFloat(arc4random_uniform(256)),
                        b: CGFloat(arc4random_uniform(256)))
    }
    
    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}

