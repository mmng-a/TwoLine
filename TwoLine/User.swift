//
//  User.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/15.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

struct User {
    //ユーザーのid
    let id: String
    
    //ユーザーのスクリーンネーム(@)calIfa_peach
    let screenName: String
    
    //ユーザーネームカリファ＠ピーチ
    let name: String
    
    //プロフィール画像URL
    let profileImageURL: String
    
    
    init?(json: Any) {
        guard let dictionary = json as? [String: Any] else { return nil }
        
        guard let id = dictionary["id_str"] as? String else { return nil }
        guard let screenName = dictionary["screen_name"] as? String else { return nil }
        guard let name = dictionary["name"] as? String else { return nil }
        guard let profileImageURL = dictionary["profile_image_url_https"] as? String else { return nil }
        
        self.id = id
        self.screenName = screenName
        self.name = name
        self.profileImageURL = profileImageURL
    }
    
}
		
