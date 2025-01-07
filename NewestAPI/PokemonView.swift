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
                HStack{
                    if let firstType = data.pokemon.types.first {
                        
                        Image(firstType.type.name ?? " ")
                            .resizable()
                            .frame(width:45,height:45)
                        Text(firstType.type.name?.capitalized ?? "No type")
                            .font(Constants.TypeFont)
                            .foregroundColor(PokemonView.textColor(inputType: firstType.type.name ?? " "))
                        Image(firstType.type.name ?? " ")
                            .resizable()
                            .frame(width:45,height:45)
                    } else {
                        Text("No type")
                    }
                    Spacer()
                    AsyncImage(url: data.pokemon.sprites.back_default){
                        phase in
                        switch phase{
                        case .empty:
                            ProgressView()
                                .frame(height:150)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:135,height:135)
                        case .failure(let error):
                            Image ("fnf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:500)
                        }
                    }
                }
                
               
                Text(data.pokemon.name?.capitalized ?? "Unknown")
                    .font(Constants.TitleFont)
                    .padding()
                    .bold()
                
                
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
                                .frame(height: 350)
                        case .failure(let error):
                            Image ("fnf")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:500)
                        }
                    }
                }
                HStack{
                    Image(systemName: "mappin")
                        .resizable()
                        .frame(width:15,height: 40)
                    Text("Height: \(data.pokemon.height*10) cm")
                        .font(Constants.TextFont)
                    Spacer()
                }
                HStack{
                    Image(systemName: "mappin")
                        .resizable()
                        .frame(width:15,height: 40)
                    Text("Weight: \(data.pokemon.weight*100) grams")
                        .font(Constants.TextFont)
                    Spacer()
                }
                
            }
        }.padding()
            .task {
                await data.getData(urlString: urlString)
            }
    }
    static func textColor (inputType: String)->Color{
        switch inputType{
        case "bug":
            return Color.bugColor
        case "dark":
            return Color.darkColor
        case "dragonColor":
            return Color.dragonColor
        case "electric":
            return Color.electricColor
        case "fairy":
            return Color.fairyColor
        case "fighting":
            return Color.fightingColor
        case "fire":
            return Color.fireColor
        case "flying":
            return Color.flyingColor
        case "ghost":
            return Color.ghostColor
        case "grass":
            return Color.grassColor
        case "ground":
            return Color.groundColor
        case "ice":
            return Color.iceColor
        case "normal":
            return Color.normalColor
        case "poison":
            return Color.poisonColor
        case "psychic":
            return Color.psychicColor
        case "rock":
            return Color.rockColor
        case "steel":
            return Color.steelColor
        default:
            return Color.waterColor
            
        }
        
    }
}



#Preview {
    PokemonView(urlString: "https://pokeapi.co/api/v2/pokemon/1/")
}
