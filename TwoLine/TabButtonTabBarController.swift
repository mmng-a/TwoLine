//
//  TabButtonTabBarController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

public extension UIColor {
    static let systemDefaultTintBlue = UIColor(red: 21.0/255.0, green: 126.0/255.0, blue: 251.0/255.0, alpha: 1.0)
    static let systemDefaultTintGray = UIColor(red: 146.0/255.0, green: 146.0/255.0, blue: 146.0/255.0, alpha: 1.0)
    static let currentColor = UIColor(red: 105/255, green: 182/255, blue: 245/255, alpha: 1.0)
}


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
        let reloadImage = UIImage(named: "reload.png")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tabButton.setImage(reloadImage, for: UIControlState.normal)
        tabButton.tintColor = UIColor.systemDefaultTintGray
        tabButton.sizeToFit()
        tabButton.center = CGPoint(x: tabBar.bounds.size.width * 0.7, y: tabBar.bounds.size.height / 2)
        tabButton.addTarget(self, action: #selector(TabButtonTabBarController.tapButton), for: .touchUpInside)
        tabBar.addSubview(tabButton)
        
        //tabButtonのしたのlabel
//        let tabButtonLabel = UILabel()
//        tabButtonLabel.text = "reload"
//        tabButtonLabel.sizeToFit()
//        tabButtonLabel.center = CGPoint(x: tabBar.bounds.size.width * 0.7, y: tabBar.bounds.size.height / 6 * 5)
//        
//        tabBar.addSubview(tabButtonLabel)
    }
    
//    private func setupTabButtonLabel(){
//        let TabButtonLabel = UILabel
//        TabButtonLabel.sizeToFit()
//        TabButtonLabel.drawText(in rect: (x: ))
//        
//    }
    
    func tapButton() {
        print("Tap TabButton")
    }
    
    
}
