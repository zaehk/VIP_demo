//
//  ApiRouter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation
import Alamofire

//enum to organize all the info needed to perform every call of the app

internal enum ApiRouter {
    
}

extension ApiRouter: Alamofire.URLRequestConvertible {
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return ""
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        return URLRequest.init(url: URL.init(fileURLWithPath: ""))
    }
    
}
