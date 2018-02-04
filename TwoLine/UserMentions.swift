//
//  UserMentions.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/01/07.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

struct UserMentions {
    
    var screenName: String = ""
    
    var idStr: Int = 0
    
    var indices: [Int]
    
    init(json: JSON) {
        
        self.screenName = json["screen_name"].stringValue
        self.idStr = json["id_str"].intValue
        self.indices = json["indices"].arrayValue.map({$0.intValue})
    }
    
}
