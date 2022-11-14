//
//  ContentView.swift
//  Clicker
//
//  Created by Ruben Granet on 02/02/2022.
//

import SwiftUI

struct GameView: View {
    // Necessary viarables for the game
    @AppStorage("pseudo") var pseudo = ""
    @State var gameIsProgress = false
    @State var score = 0
    @StateObject var gameManager = GameManager()
    @State var loginScreenPresented = true
    @State var password = ""
    @State var messageErrorPassword : String
    var isOnFire: Bool {
        guard let bestScore = gameManager.bestGame?.score else { return false }
        return score > bestScore
    }
    
    
    //Main View
    var body: some View {
        VStack {
//            NavigationLink("Settings") {
//                SettingsView()
//            }
//
//            Button {
//                loginScreenPresented = true
//            } label: {
//                Text("Logout")
//            }
            
            
            // EditableTextField(label: "Indiquez votre pseudo", editedText: $pseudo)
            HStack {
                if isOnFire {
                    Image(systemName: "flame")
                }
                Text("Score de \(pseudo) : \(score)")
                    .padding()
            }.font(.title)
            
            if gameIsProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .padding()
                    .onTapGesture {
                        userTouchedClickButton()
                    }
            }
            
            if gameManager.listGameResult.count > 0 {
                HStack{
                    Image(systemName: "star")
                    Text("Hall Of Fame")
                    Image(systemName: "star")
                }
            }
            
            ResultListView(listResult: gameManager.listGameResult)
            Spacer()
            if gameIsProgress == false {
                Button("Nouvelle Partie") {
                    userNewGameButton()
                }.padding()
            }
        }.navigationTitle("Clicker")
            .fullScreenCover(isPresented: $loginScreenPresented, content: {
                GameLoginView(loginScreenPresented: $loginScreenPresented)
            } )
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("Settings") {
                        SettingsView()
                    }
                }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            loginScreenPresented = true
                        } label: {
                            Text("Logout")
                        }

                    }
            }
    }
    
    
    
    
    
    //    func secretPassword() {
    //        if password == "" {
    //            messageErrorPassword = "Veuillez indiquer un mot de passe"
    //        } else if password == "OK" {
    //            loginScreenPresented = false
    //        } else {
    //            messageErrorPassword = "Login ou mot de passe incorrect"
    //        }
    //    }
    
    
    func userNewGameButton() {
        score = 0
        gameIsProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) {
            _ in
            gameDidFinish()
        }
    }
    
    func userTouchedClickButton(){
        if gameIsProgress {
            score = score + 1
        }
    }
    
    func gameDidFinish(){
        gameIsProgress = false
        gameManager.gameDidFinish(username: pseudo, score: score)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(messageErrorPassword: "")
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
