//
//  HomeBaseViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/02/18.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import TabPageViewController

class HomeBaseViewController: UITabBarController {
    
    var pageViewControllers: [UIViewController]!

    override func viewDidLoad() {
        setupHome()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupHome() {
        
        let pageVC = TabPageViewController.create()
        let vc1 = PageTableViewController.create()
        let vc2 = ListTimelineViewController()
        let vc3 = ListTimelineViewController()
        pageVC.tabItems = [(vc1, "Home"), (vc2, "listtimeline"), (vc3, "test")]
        pageVC.tabBarItem.image = UIImage(named: "Home.png")
        if pageVC.tabItems.count >= 3 {
            pageVC.isInfinity = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
