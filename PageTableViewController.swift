//
//  PageTableViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/06/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit
import SwiftyJSON
import TwitterKit

class PageTableViewController: UITableViewController {
    
    
    static var users: [User] = []
    var tweets: [Tweet] = []
    
    var accountStore: ACAccountStore = ACAccountStore()
    var twitterAccount: ACAccount?
    
    static func create() -> PageTableViewController {
        let sb = UIStoryboard(name: "PageTableViewController", bundle: Bundle(for: PageTableViewController.self))
        return sb.instantiateInitialViewController() as! PageTableViewController
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PageTweetTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tweet") as! PageTweetTableViewCell
        cell.setCell(tweet: self.tweets[indexPath.row])
        return cell
    }
    
    func ShowTweet(){
        guard let session = TWTRTwitter.sharedInstance().sessionStore.session() else {
        
            return
        }
        
        var clientError: NSError?
        
        let apiClient = TWTRAPIClient(userID: session.userID)
        DispatchQueue.global(qos: .default).async {
            let request = apiClient.urlRequest(
                withMethod: "GET",
                urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
                parameters: [
                    "user_id": session.userID,
                    "count": "200", // Intで10を渡すとエラーになる模様で、文字列にしてやる必要がある
                ],
                error: &clientError
            )
            apiClient.sendTwitterRequest(request) { response, data, error in // NSURLResponse?, NSData?, NSError?
                if let error = error {
                    print(error.localizedDescription)
                } else if let data = data {
                    
                    self.tweets = TimelineParser.parse(data: data)
                    self.tableView.reloadData()
                }
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ShowTweet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tweets.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
