//
//  Tweet.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/15.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON

class Tweet {
    // Tweetのid
    var idStr: String = ""
    
    // Tweetの本文
    let text: String?
    
    // Tweetのユーザー
    let user: User?
    
    // Tweetされた時間
    var createdAt: String = ""
    
    // HashTag, URL and media
    let entities: Entities?
    
    //自分がお気に入りしたか
    var favorited: Bool = false
    
    //自分がRTしたか
    var retweeted: Bool = false
    
    //お気に入り数
    var favoriteCount: Int = 0
    
    //返信先ユーザーネーム
    let inReplyToScreenName: String?
    
    //返信先ツイートID
    let inReplyToStatusIdStr: String?
    
    //返信先ユーザーID
    let inReplyToUserIdStr: String?
    
    //RTしたツイート
    let retweetedStatus: Tweet2?
    
    //引用RTしたTweetのID
    let quotedStatusIdStr: String?
    
    //引用したTweet
    let quotedStatus: Tweet2?
    
    //RTした結果140字を超えるか(http://absg.hatenablog.com/entry/2016/11/01/205507これを参考に後で…で表示されないように)
    var truncated: Bool = false
    
    
    init(json: JSON) {
        self.idStr = json["id_str"].stringValue
        self.text = json["full_text"].stringValue
        self.user = User(json: json["user"])
        self.createdAt = json["created_at"].stringValue
        self.entities = Entities(json: json["entities"])
        self.favorited = json["favorited"].boolValue
        self.retweeted = json["retweeted"].boolValue
        self.favoriteCount = json["favorite_count"].intValue
        self.inReplyToScreenName = json["in_reply_to_screen_name"].stringValue
        self.inReplyToStatusIdStr = json["in_reply_to_status_id_str"].stringValue
        self.inReplyToUserIdStr = json["in_reply_to_user_id_str"].stringValue
        self.retweetedStatus = Tweet2(json: json["retweeted_status"])
        self.quotedStatusIdStr = json["quoted_status_id_str"].stringValue
        self.quotedStatus = Tweet2(json: json["quoted_status"])
        self.truncated = json["truncated"].boolValue
    }

}
