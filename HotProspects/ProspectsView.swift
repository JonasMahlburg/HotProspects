//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jonas Mahlburg on 25.08.26.
//

import SwiftUI
import SwiftData

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted People"
        case .uncontacted:
            "Uncontacted People"
        }
    }
    
    var body: some View {
        NavigationStack {
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "Jonas Mahlburg", emailAddress: "mail@jonas-mahlburg.de", isContacted: false)
                        modelContext.insert(prospect)
                    }
                }
        }
        
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
