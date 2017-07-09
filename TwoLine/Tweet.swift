//
//  Tweet.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/15.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

struct Tweet {
    //Tweetのid
    let id: String
    
    //Tweetの本文
    let text: String
    
    //Tweetのユーザー
    let user: User
    
    
    init (id: String, text: String, user: User) {
        
        self.id = id
        self.text = text
        self.user = user
    }
}
