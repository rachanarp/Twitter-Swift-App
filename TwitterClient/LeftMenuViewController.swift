//
//  LeftMenuViewController.swift
//  TwitterClient
//
//  Created by Rachana Bedekar on 5/11/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class LeftMenuViewController: SidePanelViewController, UITableViewDelegate, UITableViewDataSource {

    let menuItems = ["About", "Home", "Sign Out", ""]
    
    @IBOutlet weak var menutableView: UITableView!
    
    override func viewDidLoad() {
        //super.viewDidLoad()

        self.menutableView.dataSource = self
        self.menutableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("row selected")
        switch (indexPath.row)
        {
            case 0:
                let containerVC = self.parentViewController as! ContainerViewController
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                containerVC.centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("centerVC") as? CenterViewController
            case 1:
                let containerVC = self.parentViewController as! ContainerViewController
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                containerVC.centerViewController = mainStoryboard.instantiateViewControllerWithIdentifier("TweetsVC") as? TweetsViewController
                containerVC.presentViewController(UINavigationController(rootViewController: containerVC.centerViewController), animated: true, completion: { () -> Void in
                    println ("presenting Home timeline")
                })
            
            case 2:
                TwitterClient().sharedInstance.logout()
            default:
            println("Unhandled row index")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("menuItemCell", forIndexPath: indexPath) as! UITableViewCell
        let menuItem : String = self.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem;
        return cell;
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
