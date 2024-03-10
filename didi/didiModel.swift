//
//  didiData.swift
//  didi
//
//  Created by Kristian Emil on 20/02/2024.
//

import Foundation
import SwiftUI

class didiModel: Identifiable {
    var id = UUID()
    var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
