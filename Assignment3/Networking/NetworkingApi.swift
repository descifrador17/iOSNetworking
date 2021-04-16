//
//  NetworkingApi.swift
//  Assignment3
//
//  Created by Dayal, Utkarsh on 16/04/21.
//

import Foundation

protocol NetwokingService {
    @discardableResult func getPokemonData(completionHandler : @escaping (Pokemons) -> ()) -> URLSessionDataTask
    
    @discardableResult func getUniversitiesData(completionHandler : @escaping ([Universities]) -> ()) -> URLSessionDataTask
}

final class NetworkingApi : NetwokingService{
    let session = URLSession.shared
    
    @discardableResult
    func getPokemonData(completionHandler: @escaping (Pokemons) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error accessing API with error \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse , (200...299).contains(httpResponse.statusCode) else{
                    print("Response Error")
                    return
                }
                guard let data = data,
                      let result = try? JSONDecoder().decode(Pokemons.self, from: data) else {
                    print("Failed to Decode")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
    
    @discardableResult
    func getUniversitiesData(completionHandler: @escaping ([Universities]) -> ()) -> URLSessionDataTask {
        let request = URLRequest(url: URL(string: "http://universities.hipolabs.com/search?country=India")!)
        let task = session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if let error = error{
                    print("Error accessing API with error \(error)")
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else{
                    print("Response Error")
                    return
                }
                guard let data = data,
                      let result = try? JSONDecoder().decode([Universities].self, from: data) else{
                    print("Failed to Decode")
                    return
                }
                completionHandler(result)
            }
        }
        task.resume()
        return task
    }
}
