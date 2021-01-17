//
//  MovieSearchSnapshotTest.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/01/2021.
//

@testable import VIP_demo
import XCTest
import SnapshotTesting

class MovieSearchSnapshotTest: XCTestCase {

    func testHomeViewController() {
      let vc = MovieSearchViewController()
        let presenter = MovieSearchPresenter()
        presenter.viewController = vc
        
        guard let mockMovieList: MovieListResponseModel = JSONMockDecoder.decode(mock: "movieListMock") else {return}
        
        let resultMovies = mockMovieList.results!
        presenter.presentMatchingMovies(movies: resultMovies)
              
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}
