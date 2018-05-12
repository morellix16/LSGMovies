//
//  MovieManager.swift
//  LSGMovies
//
//  Created by Morelli on 01/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import Foundation

class MovieManager: movieDAO {
    
    func getFavorites(_ database: FMDatabase, _ arrayMov:Array<Movie>) -> Array<Movie> {
        var arrayFav:Array<Favorite> = Array()
        var arrayResult:Array<Movie> = Array()
        
        if database.open() {
            let query = "SELECT * FROM favorites"
            let result:FMResultSet = try! database.executeQuery(query, values: nil)
            
            while(result.next()){
                let fav = Favorite(id_fav: Int(result.int(forColumnIndex: 0)), id_movie: (Int(result.int(forColumnIndex: 1))))
                arrayFav.append(fav)
            }
            result.close()
            database.close()
        }
        for movie in arrayMov{
            let auxMovie = movie
            for fav in arrayFav{
                if fav.id_movie == auxMovie.id{
                    arrayResult.append(auxMovie)
                }
            }
        }
        return arrayResult
    }
    
    
    func removeFav(_ database: FMDatabase, recordToDelete: Movie) -> Bool {
        var result = false
        if database.open(){
            let deleteFav = "DELETE FROM favorites WHERE id_movie=?"
            let data:Array=["\((recordToDelete).id!)"]
            result = database.executeUpdate(deleteFav, withArgumentsIn: data)
            database.close()
        }
        return result
    }
    
    
    func insertMovie(_ database: FMDatabase, newRecord: AnyObject) -> Bool {
        var result = false
        if database.open() {
            let insertMovie = "INSERT INTO movie VALUES(null,?,?,?,?,?)"
            let data:Array=["\((newRecord as! Movie).name!)","\((newRecord as! Movie).director!)","\((newRecord as! Movie).description!)","\((newRecord as! Movie).year!)","\((newRecord as! Movie).note!)"]
            result = database.executeUpdate(insertMovie, withArgumentsIn: data)
            database.close()
        }
        return result
    }
    
    func addToFav(_ database: FMDatabase, newRecord: Movie) -> Bool {
        var result = false
        if database.open() {
            let insertMovie = "INSERT INTO favorites VALUES(null,?)"
            let data:Array=["\((newRecord).id!)"]
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
    
    func checkFav(_ database:FMDatabase, movieToCheck:Movie)->Bool {
        
        if database.open() {
            let queryMovie = "SELECT id_movie FROM favorites where id_movie = \((movieToCheck).id!)"
            let data:Array=["\((movieToCheck).id!)"]
            let result:FMResultSet = try! database.executeQuery(queryMovie, values: nil)
            
            if result.next() {
                database.close()
                return true;
            }
        }
        
        database.close()
        return false
    }
    
}
