//
//  PageTableViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/06/26.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class PageTableViewController: UIViewController {
    
    static func create() -> PageTableViewController {
        let sb = UIStoryboard(name: "PageTableViewController", bundle: Bundle(for: PageTableViewController.self))
        return sb.instantiateInitialViewController() as! PageTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
