//
//  JCSearchViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-05-04.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit
import Parse

class JCSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //Outlets
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var searchTypeSegmentedControls: UISegmentedControl!
    @IBOutlet weak var searchTypeContainerView: UIView!
    
    //DataArrays
    var organisationArray : [PFObject] = []
    var selectedOrganisation : PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Get The Data from Parse
        var query = PFQuery(className:"Organisation")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if let error = error {
                // There was an error
                self.showDataErrorAlert(error)
            } else {
                // objects has all the Posts the current user liked.
                self.organisationArray = objects as! [PFObject]
                self.updateView()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Setup the view Title
        self.parentViewController?.navigationItem.title = "Search Organisation"
        self.parentViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem()
        self.parentViewController?.navigationItem.leftBarButtonItem!.title = ""
    }
    
    //--------------------------------------------------------------------------------------
    //Helper Methods
    
    func updateView() {
        //println(self.organisationArray)
        searchCollectionView.reloadData()
    }
    
    func showDataErrorAlert(error: NSError) {
        println("Parse data error: \(error)")
    }
    
    //--------------------------------------------------------------------------------------
    //IBActions
    @IBAction func searchTypeSegmentedControlValueChanged(sender: AnyObject) {
    }
    
    //CollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return organisationArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var currentCell = searchCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var cellImageView : UIImageView? = currentCell.viewWithTag(1) as? UIImageView
        
        var currentCellObject = organisationArray[indexPath.row] as PFObject
        

        //Hard Coded Values
        if indexPath.row % 2 == 1 {
            cellImageView?.image = UIImage(named: "neb.png")
        } else {
            cellImageView?.image = UIImage(named: "cre.png")
        }
        
        
        return currentCell;
    }
    
    //CollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //println("Selected item no \(indexPath.row)")
        
        self.selectedOrganisation = organisationArray[indexPath.row] as PFObject
        self.performSegueWithIdentifier("SearchToBusinessProfileSegue", sender: self)
    }
    
    //Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SearchToBusinessProfileSegue" {
            
            var destinationVC = segue.destinationViewController as? JCBusinessProfileViewController
            destinationVC?.currentOrganisation = selectedOrganisation as PFObject
        }
        
    }

}
