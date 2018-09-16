//
//  HomeViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/02/21.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import TabPageViewController

class HomeViewController: TabPageViewController {
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle,
                  navigationOrientation: UIPageViewControllerNavigationOrientation,
                  options: [String : Any]? = nil) {
        super.init(transitionStyle: UIPageViewControllerTransitionStyle(rawValue: 1)!,
                   navigationOrientation: UIPageViewControllerNavigationOrientation(rawValue: 0)!,
                   options: nil)
        self.setupView()
    }
    
    func setupView() {
        let vc1 = PageTableViewController.create()
        let vc2 = ListTimelineViewController()
        let vc3 = UITableViewController()
        let vc4 = UIViewController()
        let addView = PageTableViewController.create().view
        vc4.view.addSubview(addView!)
//        let tabHeight = (self.navigationController?.navigationBar.bounds.height)! + self.option.tabHeight + self.option.tabMargin
//        addView?.topAnchor.constraint(equalTo: vc4.view.topAnchor, constant: tabHeight).isActive = true
        tabItems = [(vc1, "Home"), (vc2, "ListTimeLine"), (vc3, "test"), (vc4, "test2")]
        if tabItems.count >= 4 {
            isInfinity = true
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(transitionStyle: UIPageViewControllerTransitionStyle(rawValue: 1)!, navigationOrientation: UIPageViewControllerNavigationOrientation(rawValue: 0)!, options: nil)
        self.setupView()
    }
    
}
