//
//  JCHomeViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-04-03.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit

class JCHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Outlets
    @IBOutlet weak var homeFeedTableView: UITableView!
    
    //--------------------------------------------------------------------------------------
    //ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Get the reusable cell
        var cell:UITableViewCell = self.homeFeedTableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
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
        
        
    
        
        cellContainerView?.backgroundColor = UIColor.whiteColor()
        //cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    //--------------------------------------------------------------------------------------
    //TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Display the tapped row number in the terminal
        println("Tapped Row \(indexPath.row)")
    }
}
