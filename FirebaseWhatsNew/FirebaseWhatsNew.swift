//
//  FirebaseWhatsNewApp.swift
//  FirebaseWhatsNew
//
//  Created by Gavin Kwon on 10/4/23.
//

import SwiftUI

@main
struct FirebaseWhatsNew: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WhatsNewModel())
        }
    }
}
