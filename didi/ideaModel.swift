//
//  didiData.swift
//  didi
//
//  Created by Kristian Emil on 20/02/2024.
//

import Foundation
import SwiftData

@Model
class ideaModel {
    var name: String
    var details: String
    var icon: String
    var date: Date
    var priority: Int
    
    init(name: String = "", details: String = "", icon: String = "🙂", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.icon = icon
        self.date = date
        self.priority = priority
    }
    
}
