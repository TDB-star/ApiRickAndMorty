//
//  NetworkManager.swift
//  ApiRickAndMorty
//
//  Created by Tatiana Dmitrieva on 07/08/2021.
//

import Alamofire
import UIKit

class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
   // URL session
    func fetchImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            guard url == response.url else { return }
            
            DispatchQueue.main.async {
                completion(data, response)
            }
        }
        .resume()
    }
    
//    func getCharacterImage(from url: String, completion: @escaping (Data) -> Void){
//        AF.request(url)
//            .validate()
//            .responseData { response in
//                switch response.result {
//                case . success(let imageData):
//                    completion(imageData)
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
}

class CharactersLoader {
    
    static let shared = CharactersLoader()
    
    private init() {}
    
    func fetchRequest(from url: String?, with completion: @escaping (RickAndMorty) -> Void) {
        guard let stringUrl = url else {return}
        AF.request(stringUrl).responseDecodable(of: RickAndMorty.self  ) { response in
            guard let rickAndMorty = response.value else {return}
            DispatchQueue.main.async {
                completion(rickAndMorty)
            }
            print(rickAndMorty)
        }
    }
    
    func getEpisode(from url: String?, with completion: @escaping (Welcome) -> Void) {
        guard let stringUrl = url else { return }
        AF.request(stringUrl).responseDecodable(of: Welcome.self) { response in
            guard let episode = response.value else { return }
            DispatchQueue.main.async {
                completion(episode)
            }
            print(episode)
        }
    }
    
    func getEpisodeName(from url: String?, with completion: @escaping (Result) -> Void) {
        guard let stringUrl = url else { return }
        AF.request(stringUrl).responseDecodable(of: Result.self) { response in
            guard let episode = response.value else { return }
            DispatchQueue.main.async {
                completion(episode)
            }
            print(episode)
        }
    }
}
