//
//  PageTableViewController.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/06/28.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

class PageTableViewController: UITableViewController {
    
    static var Users: [User] = []
    var Tweets: [Tweet] = []
    
    
    
    static func create() -> PageTableViewController {
        let sb = UIStoryboard(name: "PageTableViewController", bundle: Bundle(for: PageTableViewController.self))
        return sb.instantiateInitialViewController() as! PageTableViewController
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PageTweetTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tweet") as! PageTweetTableViewCell
        cell.setCell(tweet: self.Tweets[indexPath.row])
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.Tweets = []
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.estimatedRowHeight = 45
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        LoginCommunicator().login() { isSucces in
            switch isSucces {
            case false:
                print("ログイン失敗")
            case true:
                print("ログイン成功")
                
                TwitterCommunicator().getTimeline() { [weak self] data, error in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    let timelineParser = TimelineParser()
                    let tweets = timelineParser.parse(data: data!)
                    
                    self?.Tweets = tweets
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                    
                }
            }
        }

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
        return self.Tweets.count
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
