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
//            Rectangle()
//                .fill(Color.backgroundBlue)
//                .cornerRadius(Constants.cornerRadius)
//                .padding(-80)
            
            VStack{
               
                Text(data.pokemon.name?.capitalized ?? "Unknown")
                    .font(Constants.TitleFont)
                    .padding()
                    .background(Color.background)
                    .cornerRadius(40)
                
                
                HStack{
                    AsyncImage(url: data.pokemon.sprites.front_default){
                        phase in
                        switch phase{
                        case .empty:
                            ProgressView()
                                .frame(height:150)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 500)
                        case .failure(let error):
                            Image ("fnf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:500)
                        }
                    }
                    
//                    AsyncImage(url: data.pokemon.sprites.back_default){
//                        phase in
//                        switch phase{
//                        case .empty:
//                            ProgressView()
//                                .frame(height:150)
//                        case .success(let image):
//                            image
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(height: 150)
//                        case .failure(let error):
//                            Image ("fnf")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(height:150)
//                        }
//                    }
                }
                Text("Height: \(data.pokemon.height*10) cm")
                    .font(Constants.TextFont)
                Text("Weight: \(data.pokemon.weight*100) grams")
                    .font(Constants.TextFont)
                
                
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
