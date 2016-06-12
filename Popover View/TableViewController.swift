//
//  TableViewController.swift
//  Popover View
//
//  Created by Merlyn on 3/17/15.
//  Copyright (c) 2015 The App Lady. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    var musicVideoList = [String]()
    var cell: UITableViewCell!
    var selectedMusicVideo = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicVideoList = ["Video 1","Video 2","Video 3","Video 4","Video 5"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return musicVideoList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Create a reusable cell
        cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        // Configure the reusable cell
        cell.imageView?.image = UIImage(named: "music-video-32")
        cell.textLabel?.text = musicVideoList[indexPath.row]
        // Set the selected cell's background to a light mint green color
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red:0.93, green:0.98, blue:0.93, alpha:1.00)
        cell.selectedBackgroundView = bgColorView
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        let selectedCellSourceView = tableView.cellForRowAtIndexPath(indexPath)
        let selectedCellSourceRect = cell.bounds
        let popover = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idPopover") as! PopoverViewController
        popover.selectedVideoTitle = musicVideoList[indexPath.row]
        popover.message = "Welcome back Carter! 🍰🍰"
        popover.modalPresentationStyle = .Popover
        //popover.popoverPresentationController?.backgroundColor = UIColor.whiteColor()//利用しない
        popover.popoverPresentationController?.delegate = self
        popover.popoverPresentationController?.sourceView = selectedCellSourceView
        popover.popoverPresentationController?.sourceRect = selectedCellSourceRect
        popover.popoverPresentationController?.permittedArrowDirections = .Any
        popover.popoverPresentationController?.popoverBackgroundViewClass = HSPopoverBackgroundView.self
        popover.preferredContentSize = CGSize(width: 320, height: 85)
        self.presentViewController(popover, animated: true, completion: nil)
    }
    
    //MARK:

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

}
