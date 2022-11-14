//
//  GameManager.swift
//  Clicker
//
//  Created by Ruben Granet on 14/08/2022.
//

import Foundation

class GameManager: ObservableObject {
    @Published var listGameResult:[GameResult]
    let storage:CoreDataStorage = CoreDataStorage()
    var bestGame: GameResult? { listGameResult.first }
    
    
    init() {
        listGameResult = storage.fetchGameResultList()
    }
    
    
    func gameDidFinish(username:String, score:Int) {
        objectWillChange.send()
        let result = GameResult(nickname: username, score: score)
        listGameResult.append(result)
        listGameResult.sort { result1, result2 in
            result1.score > result2.score
        }
        storage.addNewGameResult(gameResult: result)
    }
}
