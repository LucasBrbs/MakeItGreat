//
//  JsonManager.swift
//  MakeItGreat
//
//  Created by Paulo Henrique Gomes da Silva on 29/11/22.
//

import Foundation

struct JsonManager {
    static func loadJson<T: Codable>(path: String) -> T? {
        if let url = Bundle.main.url(forResource: path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: T = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error: \(error)")
            }
        }
        return nil
    }
}
