//
//  HomeNavigationVC.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/02/21.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit


class HomeNavigationVC: UINavigationController {
    
    static func creat() -> HomeNavigationVC {
        let sb = UIStoryboard(name: "HomeNavigationVC", bundle: Bundle(for: HomeNavigationVC.self))
        return sb.instantiateInitialViewController() as! HomeNavigationVC
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        creatPageTableVC()
        
    }
    
    func creatPageTableVC() {
        let PageTableVC = PageTableViewController.create()
        
        
    }
    
    

}
