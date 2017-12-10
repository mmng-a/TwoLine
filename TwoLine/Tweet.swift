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
    let id: Int
    
    // Tweetの本文
    let text: String
    
    // Tweetのユーザー
    let user: User
    
    // Tweetされた時間
    let createdAt: String
    
    // hash tagとurl
    let entities: Entities?
    
    //自分がお気に入りしたか
    let favorited: Bool
    
    //自分がRTしたか
    let retweeted: Bool
    
    //返信先ユーザーネーム
    let inReplyToScreenName: String?
    
    //返信先ツイートID
    let inReplyTostatusId: Int?
    
    //返信先ユーザーID
    let inReplyToUserId: Int?
    
    //RTしたツイート
    var reweetedStatus: Tweet? = nil
    
    //引用RTしたTweetのID
    let quotedStatusId: Int?
    
    //引用したTweet
    let quotedStatus: Tweet?
    
    //RTされたTweetが途中で切れているか(http://absg.hatenablog.com/entry/2016/11/01/205507これを参考に後で修正)
    let truncated: Bool
    
    
    init(json: JSON) {
        self.id = json[""].intValue
        
    }

}
