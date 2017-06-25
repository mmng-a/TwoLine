//
//  tweet.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/14.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class tweetViewController: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController is tweetViewController {
            // tweetViewControllerはモーダルを出したい特定のタブに紐付けたViewController
            if let currentVC = self.selectedViewController{
                //表示させるモーダル
                let modalViewController: UIViewController = UIViewController()
                //わかりやすく背景を赤色に
                modalViewController.view.backgroundColor = UIColor.red
                currentVC.present(modalViewController, animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
