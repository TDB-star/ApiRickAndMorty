//
//  Model.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//


// MARK: - RickAndMorty

struct RickAndMorty: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String?
    let episode: [String]
    let url: String
    let created: String
    
    var speicesAndGender: String {
        "\(species)(\(gender))"
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

// MARK: - Welcome
struct Welcome: Codable {
    let info: Info
    let results: [Result]
}
// MARK: - Result
struct Result: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

enum URLS: String {
    case rickAndMortyapiCharacter = "https://rickandmortyapi.com/api/character"
    case rickAndMortyapiEpisode = "https://rickandmortyapi.com/api/episode"
}

