//
//  XZBUIButtonExtension.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

extension UIButton {
    
   
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, target: AnyObject, action: Selector) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        addTarget(target, action: action, for: UIControl.Event.touchUpInside)
    }
    
   
    public func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }
}
class XZBUIButtonExt: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        // 设置imageView
        imageView?.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height - 25)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: self.frame.height - 25, width: self.frame.width, height: 20)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    
}
class XZBShareButtonExt: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        // 设置imageView
        imageView?.frame = CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.height - 40)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: self.frame.height - 40, width: self.frame.width, height: 20)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    func startAnimation(delayTime:TimeInterval) {
        let originalFrame = self.frame
        self.frame = CGRect.init(origin: CGPoint.init(x: originalFrame.minX, y: 35), size: originalFrame.size)
        UIView.animate(withDuration: 0.9, delay: delayTime, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.frame = originalFrame
        }) { finished in
        }
    }
    
}
class XZBCommentFieldButtonExt: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .left
        // 设置imageView
        imageView?.frame = CGRect(x: 10, y: 5, width: 20 , height:  20)
        // 设置title
        titleLabel?.frame = CGRect(x: 40, y: 0, width: self.frame.width - 50, height: self.frame.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    
}
class XZBZanLeftButtonExt: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        // 设置imageView
        imageView?.frame = CGRect(x: self.frame.width - 25, y: 5, width: 20 , height:  20)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: 0, width: self.frame.width - 30, height: self.frame.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    
}
