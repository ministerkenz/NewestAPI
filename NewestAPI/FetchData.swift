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
