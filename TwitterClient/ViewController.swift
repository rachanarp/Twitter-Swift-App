//
//  ViewController.swift
//  TwitterClient
//
//  Created by Rachana Bedekar on 5/2/15.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

class ViewController: CenterViewController {

    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let user : User? = User.getCurrentUser()
        if (nil != user)
        {
            let profileURL = User.currentUser?.profileImageUrl
            
             self.profileImgView.setImageWithURL(NSURL(string:profileURL!))
            let screentext = (user?.screenname)!
            self.handleLabel.text = String("@" + screentext)
            self.nameLabel.text = user?.name
            self.descriptionLabel.text = (user?.tagline)!
            self.followingLabel.text = user?.following_count.stringValue
            self.followersLabel.text = user?.followers_count.stringValue
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction override func leftMenuTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    /*@IBAction override func rightMenuTapped(sender: AnyObject) {
        delegate?.toggleRightPanel?()
    }*/
}

