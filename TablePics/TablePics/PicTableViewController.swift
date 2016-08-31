//
//  PicTableViewController.swift
//  TablePics
//
//  Created by Christopher Webb-Orenstein on 8/30/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit 

class PicTableViewController: UITableViewController{
    let store = DataStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.store.getDataFromClient {
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
        
        cell.textLabel?.text = "Row #\(indexPath.row)"
        //cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return cell
    }

}
