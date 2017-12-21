//
//  YearsControllerTableViewController.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import UIKit

class YearsController: UITableViewController {

    @IBOutlet var yearsView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        

        
      
    }
 


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "197" + String(indexPath.row)

        // Configure the cell...
        

        return cell
    }
    
 


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    func retrieveSongs(yearD: Int)-> [Song]?
    {
        
        let artistFile = "artists197" + String(yearD)
        let songFile = "songs197" + String (yearD)
        
        var songs = [Song]()
        var artists: NSArray?
        var songT: NSArray?
        
        if let path = Bundle.main.path(forResource: artistFile, ofType : "plist"){
            
            artists = NSArray(contentsOfFile: path)
            
        }
        
        if let path1 = Bundle.main.path(forResource: songFile, ofType : "plist"){
            
            songT = NSArray(contentsOfFile: path1)
        }
        
        for i in 0..<songT!.count{
            
            songs.append(Song(title: songT![i] as! String, artist: artists![i] as! String, position: String(i+1)))
        }
        
        return songs
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var index = self.tableView.indexPathForSelectedRow
        var row = index!.row
        
        let table = segue.destination as! SongsTableView
        
        let songs = retrieveSongs(yearD: row)
        
        table.setSongs(songs: songs!)

}
}
