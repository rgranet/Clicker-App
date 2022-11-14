//
//  ClickerApp.swift
//  Clicker
//
//  Created by Ruben Granet on 02/02/2022.
//

import SwiftUI

@main
struct ClickerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                GameView(messageErrorPassword: "")
            }
        }
    }
}
