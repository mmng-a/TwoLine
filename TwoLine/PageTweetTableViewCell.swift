//
//  PageTweetTableViewCell.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/07/09.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import Kingfisher
import TTTAttributedLabel

class PageTweetTableViewCell: UITableViewCell, TTTAttributedLabelDelegate {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileImage: UIButton!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var tweetText: TTTAttributedLabel!
    @IBOutlet weak var tweetTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        tweetText.delegate = self
        // Configure the view for the selected state
    }

    func setCell(tweet: Tweet) {
        self.tweetText.enabledTextCheckingTypes = NSTextCheckingResult.CheckingType.link.rawValue
       if tweet.retweetedStatus?.user?.name != "" {
            self.userName.text = tweet.retweetedStatus?.user?.name
            self.userScreenName.text = "@" + (tweet.retweetedStatus?.user?.screenName ?? "")
        self.userProfileImage.kf.setImage(with: URL(string: tweet.retweetedStatus?.user?.profileImageURLHttps ?? ""), for: .normal)
            self.tweetText.text = tweet.retweetedStatus?.text
        }else {
            self.userName.text = tweet.user?.name
            self.userScreenName.text = "@" + (tweet.user?.screenName ?? "")
            self.userProfileImage.kf.setImage(with: URL(string: tweet.user?.profileImageURLHttps ?? ""), for: .normal)
            self.tweetText.text = tweet.text
        }
        self.tweetTime.text = ""
        
    }
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
}
