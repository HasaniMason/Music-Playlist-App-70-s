//
//  SongsTableView.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import UIKit

class SongsTableView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
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
        return songs.count
    }
    
    private var songs : [Song] = []

    
    func setSongs(songs : [Song])
    {
        self.songs = songs
    }
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        var index = self.tableView.indexPathForSelectedRow
        let row = index!.row
        
        
    
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let webController = segue.destination as! WebViewController
        
        let searchR = search(song: songs[row])
        
        let url = selectVideo(options: searchR, targetSong: songs[row])
        webController.setURL(url: url)
        
           }
    
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SongCell

        // Configure the cell...
        cell.Title.text = songs[indexPath.row].Title
        cell.Artist.text = songs[indexPath.row].Artist
        cell.Positon.text = songs[indexPath.row].Position
        

        return cell
    }
    
    
    func search(song: Song) -> [SearchResult]
    {
        let songTitle = song.Title!.replacingOccurrences(of: " ", with: "+")
        let artist = song.Artist!.replacingOccurrences(of: " ", with: "+")
        let keywords = "\(artist)+\(songTitle)"
        let max = 50
        
        let string = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(keywords)&order=viewCount&maxResults=\(max)&type=video&videoCategory=Music&key=AIzaSyAJiIwkPJA1F7Xmy_jZobS0KRYA2ystamE"
        
        let url = (URL(string: string))
        let request = URLRequest(url: url!)
        
        let responseData = try? NSURLConnection.sendSynchronousRequest(request, returning: nil)
        
        let result = NSString(data: responseData!, encoding:String.Encoding.utf8.rawValue)
        print(result!)
        
        var searchR = [SearchResult]()
        
        let json = try! JSONSerialization.jsonObject(with: responseData!, options:.allowFragments) as! [String:AnyObject]
        
        if let items = json["items"] as? NSArray
        {
            for item in items
            {
                let item1 = item as! [String:AnyObject]
                // construct your model objects here
                //Get the title
                //Get the videoID
                let videoIDDict = item1["id"] as! NSDictionary
                print(videoIDDict)
                let videoID = videoIDDict["videoId"] as? String
                print(videoID)
                
                //Get the title of the video
                let snippetDict = item1["snippet"] as! NSDictionary
                let title1 = snippetDict["title"] as? String
                print(title1)
                
                //Set the data
                
                searchR.append(SearchResult(title: title1!, id: videoID!))
            }
        }
        return searchR
    }
    
    func selectVideo(options: [SearchResult], targetSong: Song) -> URL?
    {
        for result in options
        {
            if (result.Title!.lowercased().contains((targetSong.Title?.lowercased())!) && (result.Title?.lowercased().contains((targetSong.Artist?.lowercased())!))!)
            {
                return URL(string: "https://www.youtube.com/watch?v=\(result.Id!)")!
            }
        }
        return nil
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

    /*
    // MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 


}*/
}
