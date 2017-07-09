//
//  PageTweetTableViewCell.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/07/09.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class PageTweetTableViewCell: UITableViewCell {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var usetrProfileImage: UIImageView!
    @IBOutlet var userScreenNme: UILabel!
    @IBOutlet var tweetText: UILabel!
    @IBOutlet var tweetTime: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(tweet: Tweet) {
        self.userName.text = tweet.user.name
        
        self.userScreenNme.text = tweet.user.screenName
        self.tweetText.text = tweet.text
    }

}
