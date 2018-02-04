//
//  TweetViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/09/26.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import TwitterKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tweet() {
        let composer = TWTRComposer()
        composer.setText("Hello Twitter!")
        composer.setImage(UIImage(named: "Home.png"))
        composer.setURL(URL(string: "https://dev.twitter.com"))
//        composer.show(from: self) { (result in) }
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
