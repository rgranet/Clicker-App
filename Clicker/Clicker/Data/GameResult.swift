//
//  GameResult.swift
//  Clicker
//
//  Created by Ruben Granet on 03/08/2022.
//

import Foundation

struct GameResult : Identifiable {
    var id = UUID()
    let nickname : String
    let score : Int
}
