//
//  Book.swift
//  IOS-FinalExam-Fall2021
//
//  Created by Daniel Carvalho on 2021-12-05.
//

import Foundation
import CoreData


extension Celebrity : CoreDataProviderProtocol {
    
    static let entityName : String = "Celebrity"
    
    static func all(context : NSManagedObjectContext) -> [Celebrity] {
        return CoreDataProvider.all(context: context, entityName: entityName) as! [Celebrity]
    }
    
    func save(context: NSManagedObjectContext) -> UUID? {
        if self.uuid == nil {
            self.uuid = UUID()
        }
        do {
            try CoreDataProvider.save(context: context)
            return self.uuid
        } catch {
            return nil
        }
    }
    
    func delete(context: NSManagedObjectContext) -> Bool {
        
        do {
            let result = try CoreDataProvider.delete(context: context, objectToDelete: self)
            return result
        } catch {
            return false
        }
        
    }
    
}

