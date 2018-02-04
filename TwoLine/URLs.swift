//
//  URLs.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/01/07.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

struct URLObject {
    
    //実際に実行されるURL
    var url: String?
    
    //表示されるURL
    var displayURL: String
    
    //元々のURLなど
    var realURL: String?
    var status: Int?
    var title: String?
    
    
    init(json: JSON) {
        
        self.url = json["url"].stringValue
        self.displayURL = json["display_url"].stringValue
        self.realURL = json["unwound"]["url"].stringValue
        self.status = json["unwound"]["status"].intValue
        self.title = json["unwound"]["title"].stringValue
        
    }
}
