//
//  AmigosApp.swift
//  Amigos
//
//  Created by Bibek Bhujel on 06/11/2024.
//

import SwiftUI

@main
struct AmigosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Person.self)
    }
}
