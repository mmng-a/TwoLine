//
//  TimelineParser.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/09/17.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import Foundation

struct TimelineParser {
    func parse(data: Data) -> [Tweet] {
        let serializedData = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        let json = serializedData as! [Any]
        
        let timeline: [Tweet] = json.flatMap {
            Tweet(json: $0)
        }
        
        return timeline
    }
}
