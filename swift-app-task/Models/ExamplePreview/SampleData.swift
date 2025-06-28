//
//  SampleData.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import SwiftUI
import SwiftData

/* DATOS DE PRUEBA que solo se veran y se cargaran en la preview del XCODE */
struct SampleData: PreviewModifier {
    
    // devuelve un model container de prurbea
    static func makeSharedContext() async throws -> ModelContainer {
        
        // se pasa el esquema de model
        // validad la tabla del model
        let schema = Schema([Tareas.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        // datos cargados inicial como tarea1
        let tarea1 = Tareas(id: UUID(),
                            nombre: "Realizar masterclass",
                            descripcion: "Tarea con respecto a la realización de la masterclass de SwiftData de Apple Coding Academy para el Swift Developer Program",
                            fecha: .now,
                            estado: .enProgreso)
        
        // datos cargados inicial como tarea2
        let tarea2 = Tareas(id: UUID(),
                            nombre: "Subir vídeo a Youtube",
                            descripcion: "Una vez termine el directo subirlo a Youtube para que lo vea el mundo y lo goze cosa fina como una película de Maculiculkin en un viaje a Albacete en autobús.",
                            fecha: .now,
                            estado: .pendiente)
        
        // guardamos los datos previamente cargados en la tarea1 y tarea2
        container.mainContext.insert(tarea1)
        container.mainContext.insert(tarea2)
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

// la extension es de manera generico para esta propiedad quede como previamente
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
