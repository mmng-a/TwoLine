//
//  SettingViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/14.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import TwitterKit

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupTWTRLogInButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTWTRLogInButton(){
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))");
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    
}

