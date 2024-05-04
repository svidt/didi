//
//  editIdeaView.swift
//  didi
//
//  Created by Kristian Emil on 03/04/2024.
//

import SwiftUI
import SwiftData

struct editIdeaView: View {
    @Bindable var ideas: ideaModel
    @State private var animatedSize = 1.0
    
    var body: some View {
        ZStack {
            Form {
                TextField("Name", text: $ideas.name)
                TextField("Details", text: $ideas.details, axis: .vertical)
                DatePicker("Date", selection: $ideas.date)
                
                Section("Priority") {
                    Picker("Priority", selection: $ideas.priority) {
                        Text("Meh").tag(1)
                        Text("Maybe").tag(2)
                        Text("Must").tag(3)
                    }
                    .pickerStyle(.segmented)
                    HStack {
                        Spacer()
                        Text("😻")
                        Spacer()
                        Text("🙀")
                        Spacer()
                        Text("😽")
                        Spacer()
                        Text("😽")
                        Spacer()
                        Text("😹")
                        Spacer()
                    }
                }
            }
            .navigationTitle("Edit Idea")
            .navigationBarTitleDisplayMode(.inline)
            VStack {
                Text("\(ideas.icon)")
                    .frame(height: 00)
                    .scaleEffect(animatedSize)
                    .scaledToFill()
                    .padding()
                    .onAppear()
                Spacer()
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ideaModel.self, configurations: config)
        let example = ideaModel(name: "example name", icon: "🙂")
        return editIdeaView(ideas: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
