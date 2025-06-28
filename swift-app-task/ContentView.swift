//
//  ContentView.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import SwiftUI
import SwiftData

/* VISTA INICIAL*/
struct ContentView: View {
    
// traemos la informacion para interar en la base de datos
    @Environment(\.modelContext) private var context
    @Query private var tareas: [Tareas]
    @State private var showAdd = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                //  validacion si no hay tarea muestra el siguiente mensajes
                if tareas.isEmpty {
                    ContentUnavailableView("No hay tareas",
                                           systemImage: "list.bullet.clipboard",
                                           description: Text("Aún no existen tareas en la app. Por favor, pulse el + arriba a la derecha para crear una nueva tarea."))
                    Spacer()
                    
                    //  si hay tareas para mostrar entonces ejecuta la vista de main
                } else {
                    main
                }
            }
            .navigationTitle("Tareas")
            .toolbar {
                
                // muestra para el + de crear tarea
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        
                        // toggle = nos cambia a verdadero
                        showAdd.toggle()
                        // estilo del boton +
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showAdd) {
            // llamada al formulario de crear una nueva tarea
            NewTaskView()
        }
    }
    
    var main: some View {
        // se lista los datos guardados
        List {
            // busca y muestra la informcion del la fucnion de TaskRow
            ForEach(tareas) { tarea in
                TaskRow(tarea: tarea)
            }
            // opcion de deslisado para eliminar
            .onDelete { index in
                for i in index {
                    context.delete(tareas[i])
                }
            }
        }
    }
}

// traits: .sampleData =  cargamos los datos de prueba de sampleDAta
#Preview(traits: .sampleData) {
    ContentView()
}
