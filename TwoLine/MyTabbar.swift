//
//  Tabbar.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/10/01.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class myTabBar: UITabBar {
    
    var tabBarHeight :CGFloat = 0.0
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = size.height * 0.5
        tabBarHeight = size.height
        return size
    }

}
