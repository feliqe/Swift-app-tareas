//
//  DataModel.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import Foundation
import SwiftData

// seleccion de estados de la tarea
enum EstadoTarea: String, Codable, CaseIterable, Identifiable {
    case pendiente = "Pendiente"
    case enProgreso = "En Progreso"
    case completada = "Completada"
    
    var id: Self { self }
}

@Model

/* CONTRUCCION DE LA TABLA DE LA BD */
final class Tareas {
    // @Attribute(.unique) = se señala que el atributo sea unico
    @Attribute(.unique) var id: UUID
    var nombre: String
    var descripcion: String
    var fecha: Date
    var estado: EstadoTarea
    
    // inicializador
    init(id: UUID, nombre: String, descripcion: String, fecha: Date, estado: EstadoTarea) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.fecha = fecha
        self.estado = estado
    }
}
