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
    @Query var ideas: [ideaModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(ideas, id: \.self) { idea in
                        NavigationLink(value: idea) {
                            VStack(alignment: .leading){
                                Text(idea.name)
                                    .font(.headline)
                                Text(idea.date.formatted(date: .long, time: .shortened))
                            }
                        }
                    }
                    .onDelete(perform: deleteIdea)
                }
                
                Button("Add Reminder") {}
                    .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Ideas")
            .navigationDestination(for: ideaModel.self, destination: editIdeaView.init)
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples() {
        let sample1 = ideaModel(name: "sample 1")
        let sample2 = ideaModel(name: "sample 2")
        let sample3 = ideaModel(name: "sample 3")
        
        modelContext.insert(sample1)
        modelContext.insert(sample2)
        modelContext.insert(sample3)
    }
    
    func deleteIdea(_ indexSet: IndexSet) {
        for index in indexSet {
            let idea = ideas[index]
            modelContext.delete(idea)
        }
    }
}

#Preview {
    ContentView()
}
