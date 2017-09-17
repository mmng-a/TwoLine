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
    
    
    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        
        guard let id = dictionary["id_str"] as? String else { return nil }
        guard let text = dictionary["text"] as? String else { return nil }
        guard let userJSON = dictionary["user"] else { return nil }
        guard let user = User(json: userJSON) else { return nil }
        
        self.id = id
        self.text = text
        self.user = user
    }

}
