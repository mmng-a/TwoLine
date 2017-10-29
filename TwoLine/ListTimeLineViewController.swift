//
//  ListTimeLineViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/10/29.
//  Copyright © 2017 麻生昌志. All rights reserved.
//

import UIKit
import  TwitterKit

class ListTimelineViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRListTimelineDataSource(listSlug: "surfing", listOwnerScreenName: "stevenhepting", apiClient: client)
    }
}
