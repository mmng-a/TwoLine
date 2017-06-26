//
//  SampleViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/06/25.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    
    static func create() -> SampleViewController {
        let sb = UIStoryboard(name: "SampleViewController", bundle: Bundle(for: SampleViewController.self))
        return sb.instantiateInitialViewController() as! SampleViewController
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
