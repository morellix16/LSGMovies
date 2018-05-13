//
//  SingleMovieViewController.swift
//  LSGMovies
//
//  Created by Morelli on 05/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import UIKit

class SingleMovieViewController: UIViewController {
    
    var movie:Movie?
    var moviesManager = MovieManager()
    var database:FMDatabase = SQLiteSingleton.getInstance()


    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var año: UILabel!
    @IBOutlet weak var puntuacion: UILabel!
    @IBOutlet weak var descripcion: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var añoText = "\(String(describing: movie!.year ?? 0))"
        var puntuacionText = "\(String(describing: movie!.note ?? 0))"
        
        titulo?.text = movie?.name
        director?.text = movie?.director
        año!.text = "Año: \(añoText)"
        puntuacion!.text = "Puntuación: \(puntuacionText)"
        descripcion?.text = movie?.description
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func addFav(_ sender: Any) {
        
        if moviesManager.checkFav(database, movieToCheck: movie!){
            mostrarMsgFav("Ya la tienes!")
        } else {
            
            if moviesManager.addToFav(database, newRecord: movie!) {
                mostrarMsgFav("Añadida a favoritos")
            }else{
                mostrarMsgFav("Ha ocurrido un error, intentelo de nuevo")
            }
        }
        
    }
    
    
    @IBAction func backToMain(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func mostrarMsgFav(_ msg:String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = msg
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
        
        
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
