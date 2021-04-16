//
//  Pokemons.swift
//  Assignment3
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import Foundation

struct Pokemons : Codable {
    var count : Int?
    var next : String?
    var previous : String?
    var results : [Pokemon]?
}

struct Pokemon : Codable{
    var name : String?
    var url : String?
}
