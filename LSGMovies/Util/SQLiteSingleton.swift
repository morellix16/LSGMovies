//
//  SQLiteSingleton.swift
//  LSGMovies
//
//  Created by Morelli on 05/05/2018.
//  Copyright © 2018 AlbertBerta. All rights reserved.
//

import Foundation


private let dataBaseFileName:String = "movies.db"
private var databasePath:String = String()

private var database:FMDatabase?

class SQLiteSingleton {
    
    
    class func getInstance() -> FMDatabase {
        
        if database == nil {
            
            let fileManager = FileManager()
            
            if let docsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let databaseURL = docsDir.appendingPathComponent(dataBaseFileName)
                databasePath = databaseURL.absoluteString
                database = FMDatabase(path: databasePath)
            }
            
        }
        return database!
    }
    
    
    
    
}

