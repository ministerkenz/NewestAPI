//
//  PokemonListView.swift
//  NewestAPI
//
//  Created by Paul Han (student LM) on 1/6/25.
//

import SwiftUI

struct PokemonListView: View {
    @Binding var viewState : ViewState
    @State var data = FetchData()
    @State var data2 = FetchData2()
    
    var body: some View {
//        NavigationView{
//            List(data.response.results){ result in
//                NavigationLink{
//                    
//                }label:{
//                    Text(result.name?.capitalized ?? " ")
//                }.navigationTitle("Pokémon List")
//            }
//        }
//        .task {
//            await data.getData()
//        }
        NavigationView {
                    List(data.response.results) { result in
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

#Preview {
    PokemonListView(viewState: Binding.constant(.pokemonList))
}
