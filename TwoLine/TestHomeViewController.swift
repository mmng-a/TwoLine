//
//  TestHomeViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/04/24.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit

class TestHomeViewController: UIPageViewController {
    
    var viewArray: [UIViewController]!
    var viewControllerIndex : Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewArray = [getPageTableView().self, getListTLView().self, getTablwView().self ]
        setViewControllers([viewArray[0]], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: UIPageViewControllerTransitionStyle(rawValue: 1)!, navigationOrientation: UIPageViewControllerNavigationOrientation(rawValue: 0)!, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: UIPageViewControllerTransitionStyle(rawValue: 1)!, navigationOrientation: UIPageViewControllerNavigationOrientation(rawValue: 0)!, options: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPageTableView() -> UIViewController {
        let PageTableVC = PageTableViewController.create()
        return PageTableVC
    }
    
    func getListTLView() -> UIViewController {
        let ListTimeLineVC = ListTimelineViewController()
        return ListTimeLineVC
    }
    
    func getTablwView() -> UIViewController {
        let tableVC = UITableViewController()
        return tableVC
    }

}


//pageViewによる画面遷移
extension TestHomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewControllerIndex == viewArray.count - 1 {
            viewControllerIndex = 0
        }else {
            viewControllerIndex = viewControllerIndex + 1
        }
        return viewArray[viewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if viewControllerIndex == 0 {
            viewControllerIndex = viewArray.count - 1
        }else {
            viewControllerIndex = viewControllerIndex - 1
        }
        return viewArray[viewControllerIndex]
    }
    
}
