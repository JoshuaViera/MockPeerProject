//
//  PokemonAPIClient.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

final class PokemonAPIClient {
    
    static func getPokemon(completionHandler: @escaping (Error?, [Pokemon]? ) -> Void){
        let urlString = "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks"
//        guard let url = URL(string: urlString) else {return}
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data, httpResponse) in
            if let error = error{
                print(error)
                completionHandler(AppError.badStatusCode(urlString), nil)
            }
            if let data = data {
                do {
                    let thing = try JSONDecoder().decode(Cards.self, from: data)
                    
                    completionHandler(nil, thing.cards)
                    print("I GOT DATA")
                }catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
            if let response = httpResponse{
                print("Response Code is: \(response)")
            }
        }
    }
    
}
