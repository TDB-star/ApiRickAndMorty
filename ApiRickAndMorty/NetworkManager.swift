//
//  NetworkManager.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import Alamofire

class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
    func getCharacterImage(from url: String, completion: @escaping (Data) -> Void){
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case . success(let imageData):
                    completion(imageData)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

class CharactersLoader {
    
    static let shared = CharactersLoader()
    
    private init() {}

    func fetchRequest(from url: String?, with completion: @escaping (RickAndMorty) -> Void) {
        guard let stringUrl = url else {return}
        AF.request(stringUrl).responseDecodable(of: RickAndMorty.self  ) { response in guard
            let rickAndMorty = response.value else { return }
            
            DispatchQueue.main.async {
                completion(rickAndMorty)
            }
            print(rickAndMorty)
        }
    }
    
    func getEpisode(with completion: @escaping (Welcome) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else { return }
        AF.request(url).responseDecodable(of: Welcome.self) { response in
            guard let episode = response.value else { return }
            DispatchQueue.main.async {
                completion(episode)
            }
            print(episode)
        }
    }
}

