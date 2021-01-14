//
//  MockFileConstants.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/01/2021.
//

import Foundation

protocol MockFileConstant {
    var errorOrEmpty: String { get }
    var success: String { get }
}

enum MockFile: MockFileConstant {
    
    case movieList
    case moviesWithinRange
    case movieDetail
    case reviews

    
    
    var errorOrEmpty: String {
        switch self{
        
        case .movieList:
            return "movieListEmptyMock"
        case .moviesWithinRange:
            return "moviesWithinDateRangeEmptyMock"
        case .movieDetail:
            return "movieDetailResponseMock"
        case .reviews:
            return "reviewsEmptyMock"
        }
    }
    
    var success: String {
        switch self{
        
        case .movieList:
            return "movieListMock"
        case .moviesWithinRange:
            return "moviesWithinDateRangeMock"
        case .movieDetail:
            return "movieDetailResponseMock"
        case .reviews:
            return "reviewsMock"
        }
    }
    
}
