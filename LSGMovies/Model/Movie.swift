//
//  Movie.swift
//  LSGMovies
//
//  Created by Morelli on 01/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import Foundation

struct Movie {
    
    var id:Int?
    var name:String?
    var director:String?
    var description:String?
    var year:Int?
    var note:Double?
    
    init() {
        id = nil
        name = ""
        director = ""
        description = ""
        year = 0
        note = 0.0
    }
    init(_ id:Int,_ name:String,_ director:String,_ description:String,_ year:Int,_ note:Double){
        self.id = id
        self.name = name
        self.director = director
        self.description = description
        self.year = year
        self.note = note
    }
    
    init(_ name:String,_ director:String,_ description:String,_ year:Int,_ note:Double){
        self.name = name
        self.director = director
        self.description = description
        self.year = year
        self.note = note
    }
}
