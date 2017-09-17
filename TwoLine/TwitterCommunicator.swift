//
//  TwitterCommunicator.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/09/17.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import Social

struct TwitterCommunicator {
    func getTimeline(handler: @escaping (Data?, Error?) -> ()) {
        let request = SLRequest(
            forServiceType: SLServiceTypeTwitter,
            requestMethod: .GET,
            url: URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json"),
            parameters: nil
        )
        
        request?.account = Account.twitterAccount
        
        request?.perform { data, response, error in
            if let error = error {
                handler(nil, error)
                return
            }
            
            handler(data, error)
        }
    }
}
