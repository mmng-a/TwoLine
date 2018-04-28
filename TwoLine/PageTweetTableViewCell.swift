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
import TwitterKit


class PageTweetTableViewCell: UITableViewCell, TTTAttributedLabelDelegate {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileImage: UIButton!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var tweetText: TTTAttributedLabel!
    @IBOutlet weak var tweetTime: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    var tweetStatus: String!

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
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.dateFormat = "EEE MMM dd HH:mm:ss Z yyyy"
        self.tweetText.enabledTextCheckingTypes = NSTextCheckingResult.CheckingType.link.rawValue
        var hashTagsArray: [Hashtag]
        if tweet.retweetedStatus?.user?.name != "" {
            self.userName.text = tweet.retweetedStatus?.user?.name
            self.userScreenName.text = "@" + (tweet.retweetedStatus?.user?.screenName ?? "")
            self.userProfileImage.kf.setBackgroundImage(with: URL(string: tweet.retweetedStatus?.user?.profileImageURLHttps ?? ""), for: .normal)
            self.tweetText.text = changeCharacter(text: (tweet.retweetedStatus?.text!)!)
            let date = df.date(from: (tweet.retweetedStatus?.createdAt)!)
            let durarion = date?.offsetFrom()
            self.tweetTime.text = durarion
            hashTagsArray = (tweet.retweetedStatus?.entities?.hashtags)!
            
            self.tweetStatus = tweet.retweetedStatus?.idStr
            
            if tweet.retweetedStatus?.favorited == true {
                self.favoritesButton.backgroundColor = UIColor.red
            }
        }else {
            self.userName.text = tweet.user?.name
            self.userScreenName.text = "@" + (tweet.user?.screenName ?? "")
            self.userProfileImage.kf.setBackgroundImage(with: URL(string: tweet.user?.profileImageURLHttps ?? ""), for: .normal)
            self.tweetText.text = changeCharacter(text: tweet.text!)
            let date =  df.date(from: tweet.createdAt)
            let durarion = date?.offsetFrom()
            self.tweetTime.text = durarion
            hashTagsArray = (tweet.entities?.hashtags)!
            
            self.tweetStatus = tweet.idStr
            
            if tweet.favorited == true {
                self.favoritesButton.backgroundColor = UIColor.red
            }
        }
        for i in 0 ..< hashTagsArray.count {
            let hashTag = hashTagsArray[i]
        }
    }
    
    @IBAction func favoritTweet() {
        guard let session = Twitter.sharedInstance().sessionStore.session() else {
            return
        }
        
        var clientError: NSError?
        
        let apiClient = TWTRAPIClient(userID: session.userID)
        let requestURL = "https://api.twitter.com/1.1/favorites/create.json?id=" + self.tweetStatus
        DispatchQueue.global(qos: .default).async {
            let request = apiClient.urlRequest(
                withMethod: "POST",
                url: requestURL,
                parameters: nil,
                error: &clientError)
            apiClient.sendTwitterRequest(request) { responds, Data, error in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    self.favoritesButton.backgroundColor = UIColor.red
                }
            }
        }
    }
    
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    

        
    func changeCharacter(text: String) -> String{
        
        let changeCharacters: [String: String] = ["&amp;": "&", "&lt;": "<", "&gt;": ">", "&nbsp;": "\u{00a0}", "&diams;": "♦"]
        let beforeWords = changeCharacters.keys.sorted()
        var varText = text
        
        for i in 0 ..< beforeWords.count{
            let before = beforeWords[i]
            let after = changeCharacters[before]
            while true {
                if let range = varText.range(of: before) {
                    varText.replaceSubrange(range, with: after!)
                }else {
                    break
                }
            }
        }
        
        return varText
    }
    
}
