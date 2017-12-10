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
    let hashtags: [String]
    
    //ハッシュタグのテキスト中の出現位置
    let indices: [(Int, Int)]
    
    
    
    //（短縮）URL
    let url: NSURL
    
}
