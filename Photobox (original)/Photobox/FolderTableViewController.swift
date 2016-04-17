//
//  FolderTableViewController.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class FolderTableViewController: UITableViewController {

    // MARK: Properties
    var images = [Image]()
    
    
    // MARK: Outlets
    
    
    
    // MARK: temporal function
    func loadSampleImage() {
        let photo1 = UIImage(named: "1")!
        let image1 = Image(name: "Robin", image: photo1)!
        
        let photo2 = UIImage(named:"2")!
        let image2 = Image(name: "Poster", image: photo2)!
        
        images.append(image1)
        images.append(image2)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleImage()

        // self.clearsSelectionOnViewWillAppear = false
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "folderTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! ImageTableViewCell

        let image = images[indexPath.row]
        
        cell.displayImage.image = image.image
        cell.titleLabel.text = image.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" { // find out which segue to triger
            let imageDetailViewController = segue.destinationViewController as! ImageViewController // store the destination viewcontroller into a constant
            
            if let selectedCell = sender as? ImageTableViewCell { // store the cell which is the sender as tapped by user into a constant, if the cell a not nil
                if let indexPath = tableView.indexPathForCell(selectedCell) { // store the selected cell's index path into a constant
                    let selectedImage = images[indexPath.row] // store the image of that indexpath of the array into a constant
                    imageDetailViewController.image = selectedImage // store the image into the destination view controller's image
                }
            }
        }
    }
    

}
