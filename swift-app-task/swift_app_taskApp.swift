//
//  swift_app_taskApp.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import SwiftUI
import SwiftData

@main
struct swift_app_taskApp: App {
    var sharedModelContainer: ModelContainer = {
        
// indicamos el esquema del modelo
        let schema = Schema([Tareas.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
// validamos la conexion
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
// retornamos la configuracion
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
