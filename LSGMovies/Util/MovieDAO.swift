//
//  MovieDAO.swift
//  LSGMovies
//
//  Created by Morelli on 05/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import Foundation


protocol movieDAO {
    
    func insertMovie(_ database:FMDatabase, newRecord:AnyObject)->Bool
    func addToFav(_ database:FMDatabase, newRecord:Movie)->Bool
    func readMovies(_ database:FMDatabase)->Array<Movie>
    func removeFav(_ database:FMDatabase, recordToDelete:Movie)->Bool
    func getFavorites(_ database:FMDatabase, _ arrayMov:Array<Movie>) -> Array <Movie>
    func checkFav(_ database:FMDatabase, movieToCheck:Movie)->Bool
    
}
