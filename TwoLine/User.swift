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
    
    
    init(id: String, screenName:String, name: String, profileImageURL: String) {
        
        self.id = id
        self.screenName = screenName
        self.name = name
        self.profileImageURL = profileImageURL
    }
    
}
		
