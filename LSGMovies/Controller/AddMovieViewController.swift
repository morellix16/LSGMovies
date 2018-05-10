//
//  AddMovieViewController.swift
//  LSGMovies
//
//  Created by Bertiwi on 10/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    
    var moviesManager = MovieManager()
    var database:FMDatabase = SQLiteSingleton.getInstance()
    var newMovie:Movie = Movie()
    
    
    @IBOutlet weak var et_name: UITextField!
    
    @IBOutlet weak var et_director: UITextField!
    
    @IBOutlet weak var et_description: UITextField!
    
    @IBOutlet weak var et_year: UITextField!
    
    @IBOutlet weak var et_note: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func insertMovie(_ sender: UIButton) {
        
        guard let name = et_name.text, !name.isEmpty else {
            let alertController = UIAlertController(title: "Upsie", message: "Es necesario un nombre", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let director = et_director.text, !director.isEmpty else {
            let alertController = UIAlertController(title: "Upsie", message: "Es necesario un director", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let description = et_description.text, !description.isEmpty else {
            let alertController = UIAlertController(title: "Upsie", message: "Es necesaria una descripción", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let year = et_year.text, !year.isEmpty else {
            let alertController = UIAlertController(title: "Upsie", message: "Es necesario un año", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let note = et_note.text, !note.isEmpty else {
            let alertController = UIAlertController(title: "Upsie", message: "Es necesaria un una nota", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Aceptar", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
            return
        
        }
    
        newMovie.name = name
        newMovie.director = director
        newMovie.description = description
        //newMovie.year = Int(year)
        //newMovie.note = Double(note)
        
        
    moviesManager.insertMovie(database, newRecord: <#T##AnyObject#>)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
