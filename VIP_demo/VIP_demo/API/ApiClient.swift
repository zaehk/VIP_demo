//
//  ApiClient.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation
import Alamofire

internal final class ApiClient: ApiClientProtocol {
    
    static let shared = ApiClient()
    
    private init(){
        
    }
    
    // MARK: - Alamofire manager configured with adapter and retrier
    
    private var AFManager: Alamofire.Session {
        let interceptor = Interceptor.init(adapter: ApiARequestAdapter(), retrier: ApiRetrier())
        let session = Alamofire.Session(interceptor: interceptor)
        return session
    }
    
    // MARK: - Api service function wich takes the config of the api router, parse and returns the response model or the error.
    
    func makeRequest<T>(route: ApiRouter,
                        responseModel: T.Type,
                        success: @escaping (T) -> Void,
                        failed: @escaping (Error, APIErrorType) -> Void) where T: Decodable {
        
        AFManager.request(route).validate(statusCode: ApiParameters.validationRange).responseDecodable(of: responseModel) { (response) in
            switch response.result{
                
            case .success(let data):
                success(data)
            case .failure(let error):
                guard let statusCode = response.response?.statusCode else {
                    failed(error, APIErrorType.generalServiceError)
                    return
                }
                failed(error, StatusCodes.apiErrorType(statusCode))
            }
        }
    }
}
