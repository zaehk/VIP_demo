//
//  MovieSearchInteractorTests.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import VIP_demo
import XCTest

class MovieSearchInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: MovieSearchInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupMovieSearchInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupMovieSearchInteractor()
  {
    sut = MovieSearchInteractor()
  }
  
  // MARK: Test doubles
  
  class MovieSearchPresentationLogicSpy: MovieSearchPresentationLogic
  {
    var presentMatchingMoviesCalled = false
    var presentNoMoviesFoundCalled = false
    var expectation: XCTestExpectation?

    
    func presentMatchingMovies(movies: [MovieResultResponseModel]) {
        presentMatchingMoviesCalled = true
        expectation?.fulfill()
    }
    
    func presentNoMoviesFoundOrError() {
        presentNoMoviesFoundCalled = true
        expectation?.fulfill()
    }
    

  }
  
  // MARK: Tests
  
  func testFetchMovies()
  {
    // Given
    let spy = MovieSearchPresentationLogicSpy()
    sut.presenter = spy
    spy.expectation = expectation(description: "Fetching search results")
    let movieServiceMock = MovieServiceMock.init(popular: .error, detail: .error, topRated: .error, newReleases: .error, upcoming: .error, reviews: .error, search: .success)
    sut.movieService = movieServiceMock
    
    // When
    sut.fetchMovies(queryString: "patata")
    waitForExpectations(timeout: 1, handler: nil)
    
    // Then
    XCTAssertTrue(spy.presentMatchingMoviesCalled, "fethMovies(queryString:) should ask the presenter to format the matching movies on success")
    XCTAssertTrue(movieServiceMock.searchCalled, "fetchMovies(queryString:) should ask the movie service to search for movies using the query string")
  }
    
}
