//
//  Model.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import Foundation

struct Character: Codable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let location: Location
    let image: String
}

struct Location: Codable {
    let name: String
    let url: String
}
