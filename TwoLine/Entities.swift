//
//  Entities.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/12/10.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Entities {
    
    //ハッシュタグ
    var hashtags: [Hashtag] = []
    
    //URL
    var URLs: [URLObject?] = []
    
    //@ツイート
    var userMentions: [UserMentions?] = []
    
    //media（画像、動画）
    var media: [Media?]
    
    init(json: JSON) {
    
        self.hashtags = json["hashtags"].arrayValue.map({ Hashtag(json: $0)})
        self.URLs = json["urls"].arrayValue.map({ URLObject(json:$0) })
        self.userMentions = json["user_mentions"].arrayValue.map({ UserMentions(json:$0 )})
        self.media = json["meia"].arrayValue.map({ Media(json: $0) })
    }
    
}
