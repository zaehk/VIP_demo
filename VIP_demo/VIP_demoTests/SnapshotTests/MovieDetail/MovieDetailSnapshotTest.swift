//
//  MovieDetailSnapshotTest.swift
//  VIP_demoTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/01/2021.
//

@testable import VIP_demo
import XCTest
import SnapshotTesting

class MovieDetailSnapshotTest: XCTestCase {

    func testMovieDetailViewController() {
      let vc = MovieDetailViewController()
        let presenter = MovieDetailPresenter()
        presenter.viewController = vc
        
        let movieDetail: MovieDetailResponseModel = JSONMockDecoder.decode(mock: "movieDetailResponseMock")
        let movieReviews: MovieReviewsResponseModel = JSONMockDecoder.decode(mock: "reviewsMock")
        let casting: MovieCreditsResponseModel = JSONMockDecoder.decode(mock: "movieCreditsMock")
        
        presenter.presentMovieInfo(movieDetail: movieDetail, casting: casting.cast!, crew: casting.crew!, reviews: movieReviews.results!)
              
        
        assertSnapshot(matching: vc, as: .image(on: .iPhoneX), record: false)
    }

}
