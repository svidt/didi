//
//  didiApp.swift
//  didi
//
//  Created by Kristian Emil on 19/02/2024.
//

import SwiftData
import SwiftUI

@main
struct didiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ideaModel.self)
    }
}
