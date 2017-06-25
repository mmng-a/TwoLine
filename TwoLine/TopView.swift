//
//  TopView.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/06/25.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class TopViewControler: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTopView() {
        let topView = UIView()
        topView.sizeToFit()
        topView.backgroundColor = UIColor.red
        topView.tintColor = UIColor.red
        topView.frame.size.height = UIScreen.main.applicationFrame.size.height / 3
        topView.frame.size.width = UIScreen.main.applicationFrame.size.width
        topView.center = CGPoint(x: (UIScreen.main.applicationFrame.size.height) / 6, y: (UIScreen.main.applicationFrame.size.width) / 2)
            self.view.addSubview(topView)
    }
}
