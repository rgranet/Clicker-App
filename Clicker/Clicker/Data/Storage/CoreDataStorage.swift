//
//  CoreDataStorage.swift
//  Clicker
//
//  Created by Ruben Granet on 18/08/2022.
//

import Foundation
import CoreData

class CoreDataStorage {
    
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "GameResults")
           container.loadPersistentStores { description, error in
               if let error = error {
                   fatalError("Unable to load persistent stores: \(error)")
               }
           }
           return container
       }()
    
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func fetchGameResultList() -> [GameResult] {
        let gameResultList:[GameResult]
        let fetchRequest:NSFetchRequest<CDGameResult> = CDGameResult.fetchRequest()
        if let rawGameResultList = try? context.fetch(fetchRequest) {
            gameResultList = rawGameResultList.compactMap({ (rawGameResult:CDGameResult) -> GameResult? in
                GameResult(fromCoreDataObject: rawGameResult)
            })
        } else {
            gameResultList = []
        }
        
        return gameResultList
    }
    
    private func saveData(){
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Erreur pendant la sauvegarde CoreData : \(error.localizedDescription)")
            }
        }
    }
    
    func addNewGameResult(gameResult:GameResult){
        let newResult = CDGameResult(context: context)
        newResult.id = gameResult.id
        newResult.nickname = gameResult.nickname
        newResult.score = Double(gameResult.score)
        saveData()
    }
    
    private func fetchCDGameResult(withID id:UUID) -> CDGameResult? {
        let fetchRequest:NSFetchRequest<CDGameResult> = CDGameResult.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.fetchLimit = 1
        let fetchResult:[CDGameResult]? = try? context.fetch(fetchRequest)
        return fetchResult?.first
    }
    
    
    
}

extension GameResult {
    init?(fromCoreDataObject CoreDataObject:CDGameResult) {
        guard let id = CoreDataObject.id,
        let name = CoreDataObject.nickname else {
            return nil
        }
        self.id = id
        self.nickname = name
        self.score = Int(CoreDataObject.score)
    }
}
