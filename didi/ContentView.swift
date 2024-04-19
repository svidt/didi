//
//  ContentView.swift
//  didi
//
//  Created by Kristian Emil on 19/02/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [ideaModel]()
    @State private var sortOrder = SortDescriptor(\ideaModel.name)
    
    var body: some View {
        
        var ideaNum: Int = 1
        
//        let userName = NSFullUserName()
//        let deviceName = UIDevice.current.name
        
        NavigationStack(path: $path) {
            ideaListingView(sort: sortOrder)
                .navigationTitle(Text(LocalizedStringKey("HEADLINE"), comment: "A flexible headline placeholder"))
                .navigationDestination(for: ideaModel.self, destination: editIdeaView.init)
                .toolbar {
                    Text("You have \(ideaNum) ideas")
//                    Button("Sample", action: addSample)
                    Button("Add Idea", systemImage: "plus", action: addItem)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\ideaModel.name))
                            Text("Priority")
                                .tag(SortDescriptor(\ideaModel.priority, order: .reverse))
                            Text("Date")
                                .tag(SortDescriptor(\ideaModel.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addItem() {
        let item = ideaModel()
        modelContext.insert(item)
        path = [item]
    }
    
    func addSample() {
        let sample1 = ideaModel(name: "Catchy title", details: "with along and detailed description.", icon: "🙂")
        modelContext.insert(sample1)
    }
    

}

#Preview("English") {
    ContentView()
        .environment(\.locale, Locale(identifier: "en"))
}

#Preview("Dansk") {
    ContentView()
        .environment(\.locale, Locale(identifier: "da"))
}
