//
//  pokemon.swift
//  NewestAPI
//
//  Created by Paul Han (student LM) on 1/6/25.
//

import SwiftUI

struct PokemonView: View {
    @State var data = FetchData2()

    var urlString: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.backgroundBlue)
                .cornerRadius(Constants.cornerRadius)
            
            VStack{
                Text(data.pokemon.name?.capitalized ?? "Unknown")
                    .font(.largeTitle)
                    .padding()
                
                AsyncImage(url: data.pokemon.sprites.back_default){
                    phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                            .frame(height:150)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                    case .failure(let error):
                        Image ("fnf")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:150)
                    }
                }
                Text("Height: \(data.pokemon.height)")
                Text("Weight: \(data.pokemon.weight)")
                
            }
        }.padding()
            .task {
                await data.getData(urlString: urlString)
                
                if let pokemonName = data.pokemon.name {
                            print("Fetched Pokémon: \(pokemonName)")
                        } else {
                            print("No Pokémon data fetched!")
                        }
            }
    }
}



#Preview {
    PokemonView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
