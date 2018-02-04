//
//  Media.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2018/01/11.
//  Copyright © 2018年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Media {
    
    //メディアID
    var id: Int = 0
    
    //URLの位置
    var indices: [Int]
    
    //URL
    var mediaURLHttps: String = ""
    
    //t.coのURL
    var url: String = ""
    
    //ユーザーに表示されるURL
    var displayURL: String = ""
    
    //タイプ(画像or動画)
    var type: String = ""
    
    //サイズ
    var smallSize: (Int, Int, String) = (0, 0, "")
    var thumbSize: (Int, Int, String) = (0, 0, "")
    var mediumSize: (Int, Int, String) = (0, 0, "")
    var largeSize: (Int, Int, String) = (0, 0, "")
    
    //videoInfo
    var aspectRaito: [Int]!
    var durationMillis: Int!
/*var variants: [(Int, String, String)]!*/
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.indices = json["indices"].arrayValue.map({$0.intValue})
        self.mediaURLHttps = json["media_url_https"].stringValue
        self.url = json["url"].stringValue
        self.displayURL = json["display_url"].stringValue
        self.type = json["type"].stringValue
        self.smallSize = (json["sizes"]["small"]["w"].intValue, json["sizes"]["small"]["h"].intValue, json["sizes"]["small"]["resize"].stringValue)
        self.thumbSize = (json["sizes"]["thumb"]["w"].intValue, json["sizes"]["thumb"]["h"].intValue, json["sizes"]["thumb"]["resize"].stringValue)
        self.mediumSize = (json["sizes"]["medium"]["w"].intValue, json["sizes"]["medium"]["h"].intValue, json["sizes"]["medium"]["resize"].stringValue)
        self.largeSize = (json["sizes"]["laege"]["w"].intValue, json["sizes"]["laege"]["h"].intValue, json["sizes"]["laege"]["resize"].stringValue)
        self.aspectRaito = [json["video_info"]["aspect_raito"].intValue]
        self.durationMillis = json["video_info"]["duration_millis"].intValue
        
    }
    
}
