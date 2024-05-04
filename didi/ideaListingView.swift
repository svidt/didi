//
//  ideaListingView.swift
//  didi
//
//  Created by Kristian Emil on 03/04/2024.
//

import SwiftData
import SwiftUI

struct ideaListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\ideaModel.priority, order: .reverse), SortDescriptor(\ideaModel.name)]) var ideas: [ideaModel]
    
    var body: some View {
        
        List {
            ForEach(ideas, id: \.self) { idea in
                NavigationLink(value: idea) {
                    VStack(alignment: .leading){
                        HStack {
                            Text(idea.icon)
                                .font(.title)
                            Text(idea.name)
                                .font(.headline)
                            Spacer()
                            Text(String(idea.priority))
                                .font(.subheadline)
                            VStack {
                                Text(idea.date.formatted(date: .omitted, time: .shortened))
                                    .bold()
                                Text(idea.date.formatted(date: .abbreviated, time: .omitted))
                            }
                            .font(.footnote)
                        }
                    }
                }
            }
            .onDelete(perform: deleteItem)
        }
    }
    
    init(sort: SortDescriptor<ideaModel>) {
        _ideas = Query(sort: [sort])
    }
    
    func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            let item = ideas[index]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ideaListingView(sort: SortDescriptor(\ideaModel.name))
}
