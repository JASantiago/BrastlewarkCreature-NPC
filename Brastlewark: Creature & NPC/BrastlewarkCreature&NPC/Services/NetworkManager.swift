//
//  NetworkManager.swift
//  Brastlewark: Creature & NPC
//
//  Created by  Jose  Santiago on 5/20/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import Foundation

class NetworkManager {
    func getPopulation(withCompletion completion: @escaping ([Gnome]?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        guard let url = URL(string: Constants.gnomesUrl) else {
            completion(nil)
            return
        }
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            let population = try? JSONDecoder().decode(Population.self, from: data)
            completion(population?.Brastlewark)
        })
        task.resume()
    }
}
