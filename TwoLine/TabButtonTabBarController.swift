//
//  TabButtonTabBarController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class TabButtonTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabButton()
        setupHomeTab()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupHomeTab() {
        
        let pageVC = TabPageViewController.create()
        let vc1 = PageTableViewController.create()
        let vc2 = PageTableViewController.create()
        pageVC.tabItems = [(vc1, "Home"), (vc2, "Notice")]
        pageVC.tabBarItem.image = UIImage(named: "Home.png")
        self.viewControllers?.insert(pageVC, at: 0)
        if pageVC.tabItems.count >= 3 {
            pageVC.isInfinity = true
        }
    }
    
    private func setupTabButton(){
        let tabButton = UIButton(type: .custom)
        tabButton.setBackgroundImage(UIImage(named: "reload") , for: .normal)   // TODO:画像の用意
        tabButton.sizeToFit()
        tabButton.center = CGPoint(x: tabBar.bounds.size.width * 0.7 , y: tabBar.bounds.size.height - (tabBar.bounds.size.height / 2))
        tabButton.addTarget(self, action: #selector(TabButtonTabBarController.test), for: .touchUpInside)
        tabBar.addSubview(tabButton)
    }
    
    func test() {
        print("push TabButton")
    }
    
    
}
