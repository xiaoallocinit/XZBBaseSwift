//
//  XZBNavigationController.swift
//  XZBBaseSwift
//
//  Created by 🍎上的豌豆 on 2018/10/16.
//  Copyright © 2018年 xiao. All rights reserved.
//

import UIKit

class XZBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBarSetting()
    }
    private func navigationBarSetting(){
        navigationBar.tintColor           = .white
        
        /// 设置导航栏背景颜色
        navigationBar.barTintColor = .white
        
        ///  设置左右Item的文字和图片颜色 (只能是通过UIBarButtonItem创建的，通过自定义视图的不行)
        
        navigationBar.shadowImage = UIImage() // 去除导航条底部线条
        
        /// 设置中间标题字体和颜色
        navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor : XZBColorNavigationBar,
             NSAttributedString.Key.font: UIFont.init(name: "PingFang-SC-Medium", size: 15)!]
        
        
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        if self.children.count > 0 {
            // 如果push进来的不是第一个控制器
            
            let button = UIButton.init(type: .custom)
            button.setImage(UIImage.init(named: "back"), for: .normal)
            button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 60)
            button.contentHorizontalAlignment = .left
            
            button.addTarget(self, action: #selector(self.back), for: .touchUpInside)
            // 修改导航栏左边的item
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back(_ sender : UIButton){
        self .popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension XZBNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return  (self.children.count > 1)
    }
}
