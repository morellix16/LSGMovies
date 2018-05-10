//
//  Favorite.swift
//  LSGMovies
//
//  Created by Bertiwi on 09/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//


import Foundation

struct Favorite{
    var id_fav: Int?
    var id_movie: Int
    
    init(id_fav:Int, id_movie:Int) {
        self.id_fav = id_fav
        self.id_movie = id_movie
    }
    
    
    init(id_movie:Int) {
        self.id_movie = id_movie
    }
}
