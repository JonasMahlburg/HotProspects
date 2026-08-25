//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Jonas Mahlburg on 25.08.26.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
