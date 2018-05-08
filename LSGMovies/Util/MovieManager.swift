//
//  MovieManager.swift
//  LSGMovies
//
//  Created by Morelli on 01/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import Foundation

class MovieManager: movieDAO {
    
    func insertMovie(_ database: FMDatabase, newRecord: AnyObject) -> Bool {
        var result = false
        if database.open() {
            let insertMovie = "INSERT INTO movie VALUES(null,?,?,?,?,?)"
            let data:Array=["\((newRecord as! Movie).name)","\((newRecord as! Movie).director)","\((newRecord as! Movie).description)","\((newRecord as! Movie).year)","\((newRecord as! Movie).note)"]
            result = database.executeUpdate(insertMovie, withArgumentsIn: data)
            database.close()
        }
        return result
    }
    
    func addToFav(_ database: FMDatabase, newRecord: Movie) -> Bool {
        var result = false
        if database.open() {
            let insertMovie = "INSERT INTO favorites VALUES(null,?)"
            let data:Array=["\((newRecord as! Movie).id!)"]
            result = database.executeUpdate(insertMovie, withArgumentsIn: data)
            database.close()
        }
        return result
    }
    
    func readMovies(_ database: FMDatabase) -> Array<Movie> {
        var arrayResult:Array<Movie> = Array()
        
        if database.open() {
            let queryMovies = "SELECT * FROM movie"
            let result:FMResultSet = try! database.executeQuery(queryMovies, values: nil)
            
            while(result.next()){
                let movie = Movie(Int(result.int(forColumnIndex: 0)),result.string(forColumnIndex: 1)!,result.string(forColumnIndex: 2)!,result.string(forColumnIndex: 3)!,Int(result.int(forColumnIndex: 4)),result.double(forColumnIndex: 5))
                arrayResult.append(movie)
            }
            result.close()
            database.close()
        }
        return arrayResult
    }
    
    func removeFav(_ database: FMDatabase, recordToDelete: AnyObject) -> Bool {
        return true
    }
    
    func comprobarFav(_ database: FMDatabase, recordToDelete: AnyObject) -> Bool {
        return true
    }
    
    
    
    
}
