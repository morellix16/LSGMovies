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
    func removeFav(_ database:FMDatabase, recordToDelete:AnyObject)->Bool
    func comprobarFav(_ database:FMDatabase, newRecord:AnyObject)->Bool
    
}
