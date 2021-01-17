//
//  HomeSnapshotTest.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/01/2021.
//

@testable import VIP_demo
import XCTest
import SnapshotTesting

class HomeSnapshotTest: XCTestCase {

    func testHomeViewController() {
      let vc = HomeViewController()
        let presenter = HomePresenter()
        presenter.viewController = vc
        
        guard let mockMovieList: MovieListResponseModel = JSONMockDecoder.decode(mock: "movieListMock") else {return}
        
        let resultMovies = mockMovieList.results!
        presenter.onGetMoviesForHomeSucceed(popular: resultMovies, topRated: resultMovies, nowPlaying: resultMovies, upcoming: resultMovies)
              
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}
