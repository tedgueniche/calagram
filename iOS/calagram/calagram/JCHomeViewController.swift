//
//  JCHomeViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-04-03.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit

import Parse

class JCHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myNavigationItem: UINavigationItem!
    //Outlets
    @IBOutlet weak var homeFeedTableView: UITableView!
    
    //--------------------------------------------------------------------------------------
    //ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Remove the tableView insets
        self.homeFeedTableView.separatorInset = UIEdgeInsetsZero
        
        //Test Parse Setup
        //Update a Parse object
        var query = PFQuery(className: "EventStream")
        
        query.getObjectInBackgroundWithId("OqMsht4DqO", block: { (object: PFObject?, error: NSError? ) -> Void in
            
            if error != nil {
                println(error)
                
            } else if let product = object {
                println(product["attendingCount"]!)
            }
        })
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Setup the view Title
        self.parentViewController?.navigationItem.title = "Home"
        self.parentViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem()
        self.parentViewController?.navigationItem.leftBarButtonItem!.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //--------------------------------------------------------------------------------------
    //TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        //Define the number of section in the tableView
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Define the number of rows in the tableView
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Get the reusable cell
        var cell:UITableViewCell = self.homeFeedTableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        //Get all cell objects
        var cellContainerView : UIView? = self.view.viewWithTag(1)
        var cellTitleView : UIView? = self.view.viewWithTag(2)
        var cellTitleImageView : UIImageView? = self.view.viewWithTag(3) as? UIImageView
        var cellTitleLabel : UILabel? = self.view.viewWithTag(4) as? UILabel
        var cellBackgroundImageView : UIImageView? = self.view.viewWithTag(5) as? UIImageView
        var cellCircleBorderView : UIView? = self.view.viewWithTag(6)
        var cellCircleTransparentView : UIView? = self.view.viewWithTag(7)
        var cellCircleCenterView : UIView? = self.view.viewWithTag(8)
        var cellAttendingImageView : UIImageView? = self.view.viewWithTag(9) as? UIImageView
        var cellFollowingImageView : UIImageView? = self.view.viewWithTag(10) as? UIImageView
        var cellCircleMiddleBorderView : UIView? = self.view.viewWithTag(11)
        var cellAttendingNumberLabel : UILabel? = self.view.viewWithTag(12) as? UILabel
        var cellAttendingLabel : UILabel? = self.view.viewWithTag(13) as? UILabel
        var cellFollowingNumberLabel : UILabel? = self.view.viewWithTag(14) as? UILabel
        var cellFollowingLabel : UILabel? = self.view.viewWithTag(15) as? UILabel
        var cellLocationContainerView : UIView? = self.view.viewWithTag(16)
        var cellLocationImageView : UIImageView? = self.view.viewWithTag(17) as? UIImageView
        var cellLocationLabel : UILabel? = self.view.viewWithTag(18) as? UILabel
        var cellTimeLabel : UILabel? = self.view.viewWithTag(19) as? UILabel
        var cellFooterView : UIView? = self.view.viewWithTag(20)
        var cellInfoButtonImageView : UIImageView? = self.view.viewWithTag(21) as? UIImageView
        var cellCommentsButtonImageView : UIImageView? = self.view.viewWithTag(22) as? UIImageView
        var cellCameraButtonImageView : UIImageView? = self.view.viewWithTag(23) as? UIImageView
        var cellCalendarButtonImageView : UIImageView? = self.view.viewWithTag(24) as? UIImageView
        var cellStatusLabel : UILabel? = self.view.viewWithTag(25) as? UILabel
        var cellStatusImageView : UIImageView? = self.view.viewWithTag(26) as? UIImageView
        var cellSubtitleContainerView : UIView? = self.view.viewWithTag(27)
        var cellSubtitleImageView : UIImageView? = self.view.viewWithTag(28) as? UIImageView
        var cellSubtitleLabel : UILabel? = self.view.viewWithTag(29) as? UILabel
        var cellFooterBorderView : UIView? = self.view.viewWithTag(30)
        
        //Style the cell title view
        cellTitleView?.backgroundColor = UIColor.whiteColor()
        
        //Round the image and add border                    //Need to update for different screen sizes
        cellTitleImageView?.layer.cornerRadius = 29.5
        cellTitleImageView?.layer.borderWidth = 1
        cellTitleImageView?.layer.borderColor = UIColor.blackColor().CGColor
        cellTitleImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellTitleImageView?.clipsToBounds = true
        
        //Style the subtitle view
        cellSubtitleContainerView?.backgroundColor = UIColor(red: 0.651, green: 0.667, blue: 0.663, alpha: 1.00)
        cellSubtitleLabel?.textColor = UIColor.whiteColor()
        cellSubtitleImageView?.tintColor = UIColor.whiteColor()
        cellSubtitleImageView?.image = UIImage(named: "play")
        cellSubtitleImageView?.backgroundColor = UIColor.clearColor()
        
        //Style the background image
        cellBackgroundImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellBackgroundImageView?.clipsToBounds = true
        
        //Create the circle border                      //Need to update for different
        cellCircleBorderView?.layer.cornerRadius = 92.5
        cellCircleBorderView?.layer.borderWidth = 3
        cellCircleBorderView?.layer.borderColor = UIColor(red: 0.984, green: 0.878, blue: 0.878, alpha: 1.00).CGColor
        cellCircleBorderView?.clipsToBounds = true
        cellCircleBorderView?.backgroundColor = UIColor.clearColor()
        
        //Create the semi transparent circle            //Need to update for different
        cellCircleTransparentView?.layer.cornerRadius = 87.5
        cellCircleTransparentView?.clipsToBounds = true
        
        //Create the circle center view                 //Need to update for different
        cellCircleCenterView?.layer.cornerRadius = 87.5
        cellCircleCenterView?.backgroundColor = UIColor.clearColor()
        
        //Style the social Icon
        cellAttendingImageView?.image = UIImage(named: "social")
        cellAttendingImageView?.backgroundColor = UIColor.clearColor()
        
        //Style the following icon
        cellFollowingImageView?.image = UIImage(named: "rss")
        cellFollowingImageView?.backgroundColor = UIColor.clearColor()
        
        //Style the location container view
        cellLocationContainerView?.backgroundColor = UIColor.whiteColor()
        cellLocationImageView?.image = UIImage(named: "location")
        cellLocationImageView?.backgroundColor = UIColor.whiteColor()
        
        //Style the footer view
        cellFooterView?.backgroundColor = UIColor(red: 0.898, green: 0.902, blue: 0.910, alpha: 1.00)
        
        cellInfoButtonImageView?.backgroundColor = UIColor.whiteColor()
        cellInfoButtonImageView?.image = UIImage(named: "info")
        cellInfoButtonImageView?.layer.cornerRadius = 5
        cellInfoButtonImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellInfoButtonImageView?.tintColor = UIColor.blackColor()
        
        cellCommentsButtonImageView?.backgroundColor = UIColor.whiteColor()
        cellCommentsButtonImageView?.image = UIImage(named: "chat_filled")
        cellCommentsButtonImageView?.layer.cornerRadius = 5
        cellCommentsButtonImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellCommentsButtonImageView?.tintColor = UIColor.blackColor()
        
        cellCameraButtonImageView?.backgroundColor = UIColor.whiteColor()
        cellCameraButtonImageView?.image = UIImage(named: "camera")
        cellCameraButtonImageView?.layer.cornerRadius = 5
        cellCameraButtonImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellCameraButtonImageView?.tintColor = UIColor.blackColor()
        
        cellCalendarButtonImageView?.backgroundColor = UIColor.whiteColor()
        var myImage = UIImage(named: "calendar")!
        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        myImage = myImage.resizableImageWithCapInsets(myInsets)
        cellCalendarButtonImageView?.image = myImage
        cellCalendarButtonImageView?.layer.cornerRadius = 5
        cellCalendarButtonImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellCalendarButtonImageView?.tintColor = UIColor.blackColor()
        
        cellStatusImageView?.backgroundColor = UIColor.clearColor()
        cellStatusImageView?.image = UIImage(named: "status-green")
        cellStatusImageView?.layer.cornerRadius = 5
        cellStatusImageView?.contentMode = UIViewContentMode.ScaleAspectFit
        cellStatusImageView?.tintColor = UIColor.blackColor()
        
        //Style the cell container view
        cellContainerView?.backgroundColor = UIColor.whiteColor()
        
        //Remove the cell inset margin
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
        
        //Set the selection style
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    //--------------------------------------------------------------------------------------
    //TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Display the tapped row number in the terminal
        println("Tapped Row \(indexPath.row)")
    }
}
