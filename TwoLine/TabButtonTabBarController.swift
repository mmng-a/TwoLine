//
//  TabButtonTabBarController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import TwitterKit
import TabPageViewController


class TabButtonTabBarController: UITabBarController {
    
    func gobackBegin() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        setupHome()
        tabBar.bounds.size.height = tabBar.bounds.size.height * 1     //0.5~0.7
        
//        TWTRLogin()
        setupTabButton()
        setupTweetButton()
        
        //gobackBegin()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.white  // バー背景色
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupHome() {
        let pageVC = TabPageViewController.create()
        let vc1 = PageTableViewController.create()
        let vc2 = ListTimelineViewController()
        let vc3 = ListTimelineViewController()
        pageVC.tabItems = [(vc1, "Home"), (vc2, "listtimeline"), (vc3, "test")]
        let tabHeight = CGFloat(pageVC.option.tabHeight + pageVC.option.tabMargin)
        viewControllers?.append(pageVC)
        pageVC.tabBarItem.image = UIImage(named: "Home.png")
        if pageVC.tabItems.count >= 3 {
            pageVC.isInfinity = true
        }
    }
    
    private func setupTabButton(){
        let tabButton = UIButton(type: .custom)
        let AddImage = UIImage(named: "Add.png")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tabButton.setImage(AddImage, for: UIControlState.normal)
        tabButton.tintColor = UIColor.systemDefaultTintGray
        tabButton.sizeToFit()
        tabButton.bounds.size.width = tabBar.bounds.size.width * 0.2
        tabButton.bounds.size.height = tabBar.bounds.size.height
        tabButton.center = CGPoint(x: tabBar.bounds.size.width * 0.7, y: tabBar.bounds.size.height * 0.5)
        tabButton.addTarget(self, action: #selector(TabButtonTabBarController.tapTabButton), for: .touchUpInside)
        tabBar.addSubview(tabButton)
    }
    
    private func setupTweetButton(){
        let tweetButton = UIButton(type: .custom)
        let tweetImage = UIImage(named: "Tweet.png")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tweetButton.setImage(tweetImage, for: UIControlState.normal)
        tweetButton.backgroundColor = UIColor.currentColor
        tweetButton.tintColor = UIColor.white
        tweetButton.sizeToFit()
        tweetButton.bounds.size.width = tabBar.bounds.size.width * 0.2
        tweetButton.bounds.size.height = tabBar.bounds.size.height
        tweetButton.center = CGPoint(x: tabBar.bounds.size.width * 0.5, y: tabBar.bounds.size.height * 0.5)
        tweetButton.addTarget(self, action: #selector(TabButtonTabBarController.transitionTweetTextView), for: .touchUpInside)
        tabBar.addSubview(tweetButton)
    }
    
    @objc func transitionTweetTextView(){
        
    }
    
    @objc func tapTabButton() {
        print("Tap TabButton")
    }
    
    func tapTweetButton() {
        print("Tap TweetButon")
    }
    
    func TWTRLogin() {
//        Twitter.sharedInstance().logIn { session, error in
//            guard let session = session else {
//                if let error = error {
//                    print("エラーが起きました => \(error.localizedDescription)")
//                }
//                return
//            }
//            print("@\(session.userName)でログインしました")
//        }
        TWTRLogin()
    }
    
    
}
