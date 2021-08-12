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
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Species: \(species)
    Gender: \(gender)
    Origin: \(origin.name)
    Location: \(location.name)
    """
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

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

// Эту структуру я испльзовала для метода с делегированием

//struct Character: Codable {
//    let name: String
//    let status: String
//    let species: String
//    let type: String
//    let gender: String
//    let location: Location
//    let image: String
//}
//
//struct Location: Codable {
//    let name: String
//    let url: String
//}
