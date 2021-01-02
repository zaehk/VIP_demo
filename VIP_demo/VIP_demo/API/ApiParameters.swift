//
//  ApiParameters.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation

internal struct ApiParameters {
    static let requestTimeOut = 10.0
    static let timeOutBetweenRetries = 1.0
    static let validationRange = 200..<300
    
    struct MovieDBApiKey{
        static let apiKey = "api_key"
        static let keyValue = "472c07727ed5687fe20e739156cc43f4"
    }
}
