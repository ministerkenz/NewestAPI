//
//  FetchData.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/17/24.
//

import Foundation

struct FetchData{
    mutating func getData() async{
        let URLString = "https://pokeapi.co/api/v2/pokemon/ditto"
        guard let url = URL(string: URLString) else{return}
        guard let (data, _) = try? await URLSession.shared.data (from:url)else{return}
        
    }
}

struct Response: Codable{
    var name: String = "loading..."
    var url: String = " "
    var abilities: [Abilities] = []
}

struct Abilites: Codable{
    var name: String?
    var url: String?
}

extension Abilites: Identifiable{
    var id: String {name ?? " "}
    
}
