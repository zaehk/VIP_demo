//
//  JsonMockDecoder.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/01/2021.
//

import Foundation

class JSONMockDecoder {
    
    static func decode<T: Decodable>(mock: String) -> T {
        guard let pathString = Bundle(for: self).path(forResource: mock, ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: jsonData) else {
            fatalError("Failed to decode \(mock) from bundle.")
        }
        
        return loaded
    }
    
}
