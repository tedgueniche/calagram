//
//  JCBusinessProfileViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-05-04.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit
import Parse

class JCBusinessProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var numberOfFriendsLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var numberOfStreamsLabel: UILabel!
    @IBOutlet weak var streamsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameDescriptionLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var streamTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Remove the tableView insets
        self.streamTableView.separatorInset = UIEdgeInsetsZero
        
        //Make the profile image circular
        profileImageView?.layer.cornerRadius = 47.5
        profileImageView?.layer.borderWidth = 1
        profileImageView?.layer.borderColor = UIColor(red: 0.000, green: 0.255, blue: 0.537, alpha: 1.00).CGColor
        profileImageView?.clipsToBounds = true
        profileImageView?.backgroundColor = UIColor.clearColor()
        
        //Style the background color
        topContainerView.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var currentCell = streamTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var dateLabel = self.view.viewWithTag(1) as! UILabel
        var descriptionLabel = self.view.viewWithTag(2) as! UILabel
        var locationAndTimeLabel = self.view.viewWithTag(3) as! UILabel
        
        dateLabel.text = "12/05"
        descriptionLabel.text = "Millard North at Millard North"
        locationAndTimeLabel.text = "Millard Field - Omaha, NE - 7:30pm CST"
        
        //Remove the cell inset margin
        currentCell.separatorInset = UIEdgeInsetsZero
        currentCell.layoutMargins = UIEdgeInsetsZero
        currentCell.preservesSuperviewLayoutMargins = false
        
        //Set the selection style
        currentCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return currentCell;
    }
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Selected row no \(indexPath.row)")
    }


}
