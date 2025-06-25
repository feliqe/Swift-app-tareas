//
//  Item.swift
//  swift-app-task
//
//  Created by Feliqe Silva on 24-06-25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
