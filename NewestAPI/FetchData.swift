//
//  FetchData.swift
//  NewestAPI
//
//  Created by Kenzo Yubitani (student LM) on 12/17/24.
//

import Foundation

struct FetchData{
    mutating func getData() async{
        let URLString = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1302"
        guard let url = URL(string: URLString) else{return}
        guard let (data, _) = try? await URLSession.shared.data (from:url)else{return}
        
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
    mutating func getData() async{
        let URLString = Result.url
        guard let url = URL(string: URLString) else{return}
        guard let (data, _) = try? await URLSession.shared.data (from:url)else{return}
        
    }
}
