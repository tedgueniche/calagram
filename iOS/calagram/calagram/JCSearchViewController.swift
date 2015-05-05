//
//  JCSearchViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-05-04.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit

class JCSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Setup the view Title
        self.parentViewController?.navigationItem.title = "Search"
        self.parentViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem()
        self.parentViewController?.navigationItem.leftBarButtonItem!.title = ""
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
