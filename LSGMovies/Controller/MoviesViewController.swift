//
//  MoviesViewController.swift
//  LSGMovies
//
//  Created by Morelli on 01/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {

    var moviesManager = MovieManager()
    var database:FMDatabase = SQLiteSingleton.getInstance()
    let dataBaseResourceFileName:String = "movies.db"
    var dataBasePath:String = String()
    var movieDB:FMDatabase = FMDatabase()
    var arrayMovies:Array<Movie> = Array<Movie>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpExternalDataBase()
        arrayMovies = moviesManager.readMovies(database)
    }
    
    
    func setUpExternalDataBase(){
        
        let fileManager = FileManager()
        
        if let docsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let databaseURL = docsDir.appendingPathComponent(dataBaseResourceFileName)
            dataBasePath = databaseURL.absoluteString
            
            if !fileManager.fileExists(atPath: dataBasePath) {
                
                if let sourceDataBaseURL = Bundle.main.url(forResource: "movies", withExtension: "db"){
                    
                    do{
                        try fileManager.copyItem(at: sourceDataBaseURL, to: databaseURL)
                        
                    }catch{
                        print("Ya existe")
                    }
                }
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let movie = segue.destination as? SingleMovieViewController {
            movie.movie = arrayMovies[(tableView.indexPathForSelectedRow?.row)!]
        }
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
        return arrayMovies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movCell", for: indexPath)
        
        let mov:Movie = arrayMovies[indexPath.row]
        
        cell.textLabel?.text = mov.name
        
        cell.detailTextLabel?.text = mov.director
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        /*if editingStyle == .delete {
            moviesManager.deleteItem(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    
    
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
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
