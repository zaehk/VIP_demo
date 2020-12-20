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
        
        //Token logic... Customize headers....
        
    }
}
