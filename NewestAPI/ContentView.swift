//
//  ContentView.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/17/24.
//

import SwiftUI
enum ViewState{
    case pokemonList, webView
}

struct ContentView: View {
    @State var articleURL: String = " "
    @State var viewState: ViewState = .pokemonList
    
    
    var body: some View {
        if viewState == .pokemonList{
            PokemonListView(viewState: $viewState)
        }else{
            
        }
        
        }
        
    }


#Preview {
    ContentView()
}
