//
//  NetworkManager.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import Foundation

protocol CharacterLoaderDelegate {
    func characterLoader(loadCharacters: [Character])
}

class CharactersLoader {

    var delegate: CharacterLoaderDelegate?
    
    func loadCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10") else {return}
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? " ")
                return
            }
            do {
                let characters = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    self.delegate?.characterLoader(loadCharacters: characters)
                }
                print(characters)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
