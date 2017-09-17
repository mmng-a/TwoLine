//
//  PageTweetTableViewCell.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/07/09.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class PageTweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileImage: UIButton!
    @IBOutlet weak var userScreenNme: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var tweetTime: UILabel!
    
    

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
        /*let downloadTask = URLSession.shared.dataTask(with: URL(string: tweet.user.profileImageURL)!) { [weak self] data, response, error in
         if let error = error {
         print(error)
         return
         }
         
         DispatchQueue.main.async {
         // iconImageViewにダウンロードしてきた画像を代入する処理
         self?.userProfileImage.image = UIImage(data: data!)
         }
         }
         downloadTask.resume()       */self.userProfileImage.setBackgroundImage(UIImage(named: tweet.user.profileImageURL), for: .normal)
        self.userScreenNme.text = "@" + tweet.user.screenName
        self.userName.text = tweet.user.name
        self.tweetText.text = tweet.text
        self.tweetTime.text = "0"
    }

}
