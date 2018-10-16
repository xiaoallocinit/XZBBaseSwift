//
//  XZBTabBarController.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

class XZBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

         tabBar.isTranslucent = false
        
        
        let mineVC = ViewController()
        addChildViewController(mineVC,
                               title: "我的",
                               image: UIImage(named: "tab_mine"),
                               selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        //去掉线
        let TabBarLine = UITabBar.appearance()
        TabBarLine.shadowImage = UIImage()
        TabBarLine.backgroundImage = UIImage()
        
        
        childController.title = title
        
        self.tabBar.barTintColor = .white
        
    childController.tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key:UIFont.init(name: "PingFang-SC-Regular", size: 12)!,NSAttributedString.Key.foregroundColor : XZBColorTheme], for: .normal)
    childController.tabBarItem.setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key:UIFont.init(name: "PingFang-SC-Regular", size: 12)!,NSAttributedString.Key.foregroundColor : XZBColorTitle], for: .selected)
        
        
        childController.tabBarItem.image = image?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        childController.tabBarItem.selectedImage = selectedImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
//        childController.tabBarItem = UITabBarItem(title: nil,
//                                                  image: image?.withRenderingMode(.alwaysOriginal),
//                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(XZBNavigationController(rootViewController: childController))
    }
   

}
