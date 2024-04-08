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
                        Text(idea.name)
                            .font(.headline)
                        Text(idea.date.formatted(date: .long, time: .shortened))
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
