//
//  Settings.swift
//  Clicker
//
//  Created by Ruben Granet on 08/09/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Bienvenue dans les paramètres de l'application")
            .navigationTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
