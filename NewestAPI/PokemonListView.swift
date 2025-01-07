//
//  PokemonListView.swift
//  NewestAPI
//
//  Created by Paul Han (student LM) on 1/6/25.
//

import SwiftUI

struct PokemonListView: View {
    @State var data = FetchData()
    @State private var searchQuery: String = ""
    
    var filteredResults: [Result] {
        if searchQuery.isEmpty {
            return data.response.results
        } else {
            return data.response.results.filter {
                $0.name?.lowercased().contains(searchQuery.lowercased()) ?? false
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar:
                TextField("Search Pokémon", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
            
                List(filteredResults) { result in
                    NavigationLink(destination: PokemonView(urlString: result.url ?? "")) {
                        Text(result.name?.capitalized ?? "Unknown")
                    }
                }
                .navigationTitle("Pokémon List")
                .task {
                    await data.getData()
                }
                .refreshable {
                    await data.getData()
                }
            }
        }
    }
}

#Preview {
    PokemonListView()
}
