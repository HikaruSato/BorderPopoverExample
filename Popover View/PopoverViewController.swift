//
//  ViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var welcomeMessage: UITextField!
    
    var selectedVideoTitle: String!
    var message: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

