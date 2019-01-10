//
//  MagicAPIClient.swift
//  MockPeerProject
//
//  Created by Joshua Viera on 1/9/19.
//  Copyright © 2019 Joshua Viera. All rights reserved.
//

import Foundation

final class MagicAPIClient {
    
    static func getMagic(completionHandler: @escaping (Error?, [Magic]? ) -> Void){
        let urlString = "https://api.magicthegathering.io/v1/cards?contains=imageUrl"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data, httpResponse) in
            if let error = error{
                print(error)
                completionHandler(AppError.badStatusCode(urlString), nil)
            }
            if let data = data {
                do {
                    let magic = try JSONDecoder().decode(MagicCards.self, from: data)
                    completionHandler(nil, magic.cards)
                    print("\(magic.cards.count)")
                }catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
            if let response = httpResponse{
                if response.statusCode == 200{
                    print("GOOD: \(response.statusCode)")
                } else {
                    print("BAD: \(response.statusCode)")
                }
            }
        }
    }
}
