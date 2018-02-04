//
//  User.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/15.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    //ユーザーのid
    var idStr: String = ""
    
    //ユーザーのスクリーンネーム: (@)calIfa_peach
    var screenName: String = ""
    
    //ユーザーネーム: カリファ＠ピーチ
    var name: String = ""
    
    //ユーザーの場所: 東京
    let location: String?
    
    //URL
    let url: String?
    
    //鍵垢かどうか
    var protected: Bool = false

    //フォロワー数
    var followersCount: Int = 0
    
    //フォローしている人数
    var friendsCount: Int = 0
    
    //追加されているリストの数
    var listedCount: Int = 0
    
    //お気に入りした数
    var favoritesCount: Int = 0
    
    //Tweet数
    var statusesCount: Int = 0
    
    //アカウントの作成時間
    var createdAt: String = ""
    
    //世界標準時との時差
    var utcOffset: Int = 0
    
    //タイムゾーン
    var timeZone: String = ""
    
    //位置情報などの有無
    var geoEnabled: Bool = false
    
    //言語
    var lang: String = ""
    
    //ヘッダー画像のURL
    var profileBaneerURL: String?
    
    //プロフィール画像のURL
    var profileImageURLHttps: String?
    
    //プロフィールのテーマカラー
    var profileLinkColor: String = ""
    
    
    
    init(json: JSON) {
        self.idStr = json["id_str"].stringValue
        self.screenName = json["screen_name"].stringValue
        self.name = json["name"].stringValue
        self.location = json["location"].stringValue
        self.url = json["url"].stringValue
        self.protected = json["protected"].boolValue
        self.followersCount = json["followers_count"].intValue
        self.friendsCount = json["friends_count"].intValue
        self.listedCount = json["list_count"].intValue
        self.favoritesCount = json["favorites_count"].intValue
        self.statusesCount = json["statuses_count"].intValue
        self.createdAt = json["create_at"].stringValue
        self.utcOffset = json["utc_offset"].intValue
        self.timeZone = json["time_zone"].stringValue
        self.geoEnabled = json["geo_enabled"].boolValue
        self.lang = json["lang"].stringValue
        self.profileBaneerURL = json["profile_banner_url"].stringValue
        self.profileImageURLHttps = json["profile_image_url_https"].stringValue
        self.profileLinkColor = json["profile_link_color"].stringValue

    }
    
}
		
