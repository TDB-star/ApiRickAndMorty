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
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}

class CharactersLoader {
    
    static let shared = CharactersLoader()
    
    private init() {}

    //var delegate: CharacterLoaderDelegate?
    
    func fetchRequest(with complition: @escaping (RickAndMorty) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}
        AF.request(url).responseDecodable(of: RickAndMorty.self  ) { (response) in guard
            let rickAndMorty = response.value else {return}
            DispatchQueue.main.async {
                complition(rickAndMorty)
            }
            print(rickAndMorty)
        }
    }
    /* func loadCharacters() {
         guard let url = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20") else {return}
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
     }*/
}

/*protocol CharacterLoaderDelegate {
    func characterLoader(loadCharacters: [Character])
}*/
