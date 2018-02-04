//
//  TimelineParser.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/09/17.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TimelineParser {
    static func parse(data: Data) -> [Tweet] {

        
        let json = JSON(data)
        print(json)

        let timeline: [Tweet] = json.arrayValue.map({ Tweet(json: $0) })

        return timeline
    }
}

