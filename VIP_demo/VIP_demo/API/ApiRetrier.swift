//
//  ApiRetrier.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation
import Alamofire

internal final class ApiRetrier: RequestRetrier {
    
    // MARK: - Variables
    private var retriedRequests: [String: Int] = [:]
    
    // MARK: - Protocol Methods
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        guard request.task?.response == nil,
            let url = request.request?.url?.absoluteString else {
            removeCachedUrlRequest(url: request.request?.url?.absoluteString)
            completion(.doNotRetry)
            return
        }
        
        guard let retryCount = retriedRequests[url] else {
            retriedRequests[url] = 1
            completion(.retryWithDelay(ApiParameters.timeOutBetweenRetries))
            return
        }
        
        if retryCount <= 3 {
            retriedRequests[url] = retryCount + 1
            completion(.retryWithDelay(ApiParameters.timeOutBetweenRetries))
        } else {
            removeCachedUrlRequest(url: url)
            completion(.doNotRetry)
        }
    }
    
    // MARK: - Private Methods
    private func removeCachedUrlRequest(url: String?) {
        guard let url = url else { return }
        retriedRequests.removeValue(forKey: url)
    }
}
