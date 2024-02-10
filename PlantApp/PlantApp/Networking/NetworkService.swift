//
//  NetworkService.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import Foundation
/**
 A generic network service class for handling API requests and responses.

 This class follows the singleton pattern with a shared instance to provide a single point of access to network functionalities. It allows sending requests to a specified endpoint and handles the corresponding responses. The base URL for API requests is defined, and responses are decoded using the Codable protocol.

 Example usage:

 ```swift
 // Create an instance of the NetworkService for a specific Codable type.
 let networkService = NetworkService<MyResponseModel>.shared

 // Send a request to a specific API endpoint.
 networkService.sendRequest(for: .getCategories) { result in
     switch result {
     case .success(let decodedData):
         // Handle the decoded data in case of a successful response.
         print("Decoded data: \(decodedData)")
     case .failure(let error):
         // Handle the error in case of a failure.
         print("Error: \(error.localizedDescription)")
     }
 }
 
Note: This class assumes the existence of the Endpoints enum, the GeneralError enum, and a Codable type specified when creating an instance.
*/

class NetworkService<T : Codable>{
    static var shared: NetworkService<T> {
        return NetworkService<T>()
    }
    let baseURL = "https://dummy-api-jtg6bessta-ey.a.run.app/"
    private init() {}
    
    func sendRequest(for requestURL : Endpoints, completed : @escaping(Result<T, GeneralError>) -> Void){
        
        guard let url = URL(string: baseURL + requestURL.rawValue) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedObject = try decoder.decode(T.self, from: data)
                completed(.success(decodedObject))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}

