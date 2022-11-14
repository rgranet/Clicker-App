//
//  GameLoginView.swift
//  Clicker
//
//  Created by Ruben Granet on 07/09/2022.
//

import SwiftUI

struct GameLoginView: View {
    @AppStorage("pseudo") var pseudo = ""
    @State var password = ""
    @State var messageErrorPassword = ""
    @Binding var loginScreenPresented:Bool
    
    var body: some View {
        VStack {
            TextField("Veuillez indiquer votre pseudo", text: $pseudo)
                .frame(width: 300.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Mot de passe", text: $password)
                .frame(width: 300.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(messageErrorPassword)
                .foregroundColor(.red)
                .frame(width: 300.0)
                .padding()
            Button {
                secretPassword()
            } label: {
                Text("Connexion")
            }
            
        }
    }
    func secretPassword() {
        if password == "" {
            messageErrorPassword = "Veuillez indiquer un mot de passe"
        } else if password == "OK" {
            loginScreenPresented = false
        } else {
            messageErrorPassword = "Login ou mot de passe incorrect"
        }
    }
    
}

struct GameLoginView_Previews: PreviewProvider {
    static var previews: some View {
        GameLoginView(loginScreenPresented: .constant(false))
    }
}
