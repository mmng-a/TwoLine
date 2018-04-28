//
//  Hashtag.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/01/07.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Hashtag {
      
    //テキスト
    var text: String?
    
    //開始と終わりの文字の位置
    var indices: [Int]
    
    init(json:JSON) {
        
        self.text = json["test"].stringValue
        self.indices = json["indices"].arrayValue.map({$0.intValue})
        
    }
    
    
}
