//
//  FetchData.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/17/24.
//

import Foundation

struct FetchData{
    var response :Response = Response()

    mutating func getData() async{
        let URLString = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1302"
        guard let url = URL(string: URLString) else{return}
        guard let (data, _) = try? await URLSession.shared.data (from:url)else{return}
        
        guard let r = try? JSONDecoder().decode(Response.self, from: data)else{return}
        response = r
        
    }
}

struct Response: Codable{
    var count: Int = 0
    var next: String = " "
    var previous: String = " "
    var results: [Result] = []
    
    
}

struct Result: Codable{
    var name: String?
    var url: String?
}

extension Result: Identifiable{
    var id: String {name ?? " "}
    
}

struct FetchData2{
    var pokemon: Pokemon = Pokemon()
    
    mutating func getData(urlString: String) async{
        guard let url = URL(string: urlString) else{return}
        guard let (data, _) = try? await URLSession.shared.data (from:url)else{return}
        
        guard let r = try? JSONDecoder().decode(Pokemon.self, from: data)else{return}
        pokemon = r
        
    }
}

struct Pokemon :Codable{
    var height : Int = 0
    var id : Int = 0
    var name : String? = nil
    var sprites: Sprites = Sprites()
    var weight: Int = 0
}

struct Sprites: Codable {
    var showdown: Showdown = Showdown()
}

struct Showdown: Codable {
    var frontDefault: String? = nil
    var backDefault: String? = nil
}
