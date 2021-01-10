//
//  ApiRequestAdapter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation
import Alamofire

internal final class ApiARequestAdapter: RequestAdapter {
    
    // MARK: - Protocol Methods
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let apiParameters = [ApiParameters.MovieDBApiKey.apiKey : ApiParameters.MovieDBApiKey.keyValue]
        
        do{
        let validatedRequest = try URLEncoding.default.encode(urlRequest, with: apiParameters)
            completion(.success(validatedRequest))
        }catch{
            completion(.failure(error))
        }
        
    }
}
