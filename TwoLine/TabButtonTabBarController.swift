//
//  TabButtonTabBarController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import TwitterKit
import TabPageViewController


class TabButtonTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        tabBar.bounds.size.height = tabBar.bounds.size.height * 1     //0.5~0.7
        
//        TWTRLogin()
        setupTabButton()
        setupTweetButton()
        
        //gobackBegin()
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTabButton(){
        let tabButton = UIButton(type: .custom)
        let AddImage = UIImage(named: "Add.png")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tabButton.setImage(AddImage, for: UIControlState.normal)
        tabButton.tintColor = UIColor.systemDefaultTintGray
        tabButton.sizeToFit()
        tabButton.bounds.size.width = tabBar.bounds.size.width * 0.2
        tabButton.bounds.size.height = tabBar.bounds.size.height
        tabButton.center = CGPoint(x: tabBar.bounds.size.width * 0.7, y: tabBar.bounds.size.height * 0.5)
        tabButton.addTarget(self, action: #selector(TabButtonTabBarController.tapTabButton), for: .touchUpInside)
        tabBar.addSubview(tabButton)
    }
    
    private func setupTweetButton(){
        let tweetButton = UIButton(type: .custom)
        let tweetImage = UIImage(named: "Tweet.png")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        tweetButton.setImage(tweetImage, for: UIControlState.normal)
        tweetButton.backgroundColor = UIColor.currentColor
        tweetButton.tintColor = UIColor.white
        tweetButton.sizeToFit()
        tweetButton.bounds.size.width = tabBar.bounds.size.width * 0.2
        tweetButton.bounds.size.height = tabBar.bounds.size.height
        tweetButton.center = CGPoint(x: tabBar.bounds.size.width * 0.5, y: tabBar.bounds.size.height * 0.5)
        tweetButton.addTarget(self, action: #selector(TabButtonTabBarController.tapTweetButton), for: .touchUpInside)
        tabBar.addSubview(tweetButton)
    }
    
    @objc func tapTabButton() {
        print("Tap TabButton")
    }
    
    @objc func tapTweetButton() {
        print("tapTweetButton")
        openPostTweetWindow()
    }
    
    func openPostTweetWindow() {
        var postTweetTextWindow = UIWindow()
        var tweetTextView = UITextView()
        var postTweetButton = UIButton()
        var userIcon = UIButton()
        postTweetButton.addTarget(self, action: #selector(self.postTweet(_: )), for: .touchUpInside)
        postTweetTextWindow.bounds = UIScreen.main.bounds
        postTweetTextWindow.center.x = UIScreen.main.bounds.width / 2
        postTweetTextWindow.center.y = UIScreen.main.bounds.height / 2
        postTweetTextWindow.backgroundColor = UIColor.red
        tabBar.addSubview(postTweetTextWindow)
    }
    
    @objc func postTweet(_ sender: UIButton) {
        
        let tweetText: String = ""
        
        guard let session = Twitter.sharedInstance().sessionStore.session() else {
            return
        }
        var clientError: NSError?
        
        let apiClient = TWTRAPIClient(userID: session.userID)
        DispatchQueue.global(qos: .default).async {
            
            let request = apiClient.urlRequest(
                withMethod: "POST",
                url: "https://api.twitter.com/1.1/statuses/update.json?",
                parameters: [
                    "status": tweetText
                ],
                error: &clientError
            )
            apiClient.sendTwitterRequest(request) { response, data, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    
                }
            }
        }
    }
    
}
