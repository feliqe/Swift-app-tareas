//
//  TaskRow.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import SwiftUI

/* VISTA QUE MUESTRA LA TAREAS */
struct TaskRow: View {
    let tarea: Tareas
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // carga informacion de la tareas
            Text(tarea.nombre)
                .font(.headline)
            HStack {
                Text(tarea.fecha.formatted(date: .long, time: .omitted))
                Spacer()
                Text(tarea.estado.rawValue)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }
}
