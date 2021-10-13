//
//  CampusSaleApp.swift
//  CampusSale
//
//  Created by Eric Chang on 10/13/21.
//

import SwiftUI

@main
struct CampusSaleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
