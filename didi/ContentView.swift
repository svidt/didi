//
//  ContentView.swift
//  didi
//
//  Created by Kristian Emil on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    var model: didiModel
    
    let items = ["Apple", "Orange", "Melon"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { data in
                    Text(data)
                }
            }
            .navigationTitle("Didi")
            Button("Add Reminder") {}
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView(model: didiModel(name: "Preview Name"))
}
