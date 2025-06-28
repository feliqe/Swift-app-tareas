//
//  NewTaskView.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import SwiftUI

/* CREAR TAREAS NUEVAS */
struct NewTaskView: View {
    // nos quita la pantalla cuando se finalize o se cancele
    @Environment(\.dismiss) private var dismiss
    // traemos la informacion para interar en la base de datos
    @Environment(\.modelContext) private var context
    
    // valore disponibles para usar
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var fecha: Date = Date()
    @State private var estado: EstadoTarea = .pendiente
    
    var body: some View {
        NavigationStack {
            Form {
                // campos del formulario con sus estilo
                VStack(alignment: .leading) {
                    Text("Nombre de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese el nombre de la tarea", text: $nombre)
                }
                VStack(alignment: .leading) {
                    Text("Descripción de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese la descripción de la tarea", text: $descripcion)
                }
                DatePicker(selection: $fecha, displayedComponents: .date) {
                    Text("Fecha de la tarea")
                }
                Picker(selection: $estado) {
                    ForEach(EstadoTarea.allCases) { tarea in
                        Text(tarea.rawValue)
                    }
                } label: {
                    Text("Seleccione estado")
                }
            }
            .textFieldStyle(.roundedBorder)
            .navigationTitle("Nueva Tarea")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        // creamos variable con la informacion del formulario
                        let newTarea = Tareas(id: UUID(),
                                              nombre: nombre,
                                              descripcion: descripcion,
                                              fecha: fecha,
                                              estado: estado)
                        // con esta instruccion pasamos la instacia del modelo y se inserta directo en la base de datos
                        context.insert(newTarea)
                        // para cerrar la pantalla
                        dismiss()
                    } label: {
                        Text("Crear")
                    }
                }
                // booton para cancelar
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

// para cargar los datos de inicio y que los considere en el emulador de XCODE
#Preview(traits: .sampleData) {
    NewTaskView()
}
