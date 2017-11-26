//
//  PostTweetViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/09/17.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import Accounts
import Social

class PostTweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func postTweet() {
        //ツイートを投稿
        let URL = NSURL(string: "https://api.twitter.com/1.1/statuses/update.json")
        
        // ツイートしたい文章をセット
        let params = ["status" : "Tweet from iOS!"]
        
        // リクエストを生成
        let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                requestMethod: .POST,
                                url: URL as URL!,
                                parameters: params)
        
        // 取得したアカウントをセット
        request?.account = Account.twitterAccount
        
        // APIコールを実行
        request?.perform { (responseData, urlResponse, error) -> Void in
            
            if error != nil {
                print("error is \(String(describing: error) )")
            }
            else {
                // 結果の表示
            //    let result = JSONSerialization.JSONObjectWithData(responseData, options: .AllowFragments, error: nil) as NSDictionary
                var result: [String: Any] = [:]
                do {
                    result = try JSONSerialization.jsonObject(with: responseData!, options: .allowFragments) as! [String: Any]
                    
                } catch _ as NSError {
                    // エラー処理をする
                }
                print("result is \(result)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
