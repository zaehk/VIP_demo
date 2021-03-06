//
//  HomeInteractorTests.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 05/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import VIP_demo
import XCTest

class HomeInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: HomeInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupHomeInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHomeInteractor()
    {
        sut = HomeInteractor()
        sut.movieService = MovieServiceMock(popular: .success, detail: .success, topRated: .success, newReleases: .success, upcoming: .success, reviews: .success, search: .success)
    }
    
    // MARK: Test doubles
    
    class HomePresentationLogicSpy: HomePresentationLogic
    {
        var onGetMoviesForHomeSucceedCalled = false
        var onGetMoviesForHomeAllFailedCalled = false
        var expectation: XCTestExpectation?
        
        func onGetMoviesForHomeSucceed(popular: [MovieResultResponseModel], topRated: [MovieResultResponseModel], nowPlaying: [MovieResultResponseModel], upcoming: [MovieResultResponseModel]) {
            onGetMoviesForHomeSucceedCalled = true
            expectation?.fulfill()
        }
        
        func onGetMoviesForHomeAllFailed() {
            onGetMoviesForHomeAllFailedCalled = true
            expectation?.fulfill()
        }
        
    }
    
    // MARK: Tests
    
    func testAllMovieCategoriesSucceed()
    {
        // Given
        let spy = HomePresentationLogicSpy()
        spy.expectation = expectation(description: "Downloading movies categories")
        sut.presenter = spy
        
        
        // When
        sut.fetchMovies()
        
        // Wait
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertTrue(spy.onGetMoviesForHomeSucceedCalled, "doSomething(request:) should ask the presenter to format the result of the movies if some of their arrays are populated")
    }
    
    func testAllMovieCategoriesFailed(){
        // Given
        let spy = HomePresentationLogicSpy()
        spy.expectation = expectation(description: "Downloading movies categories")
        sut.presenter = spy
        sut.movieService = MovieServiceMock.init(popular: .error, detail: .error, topRated: .error, newReleases: .error, upcoming: .error, reviews: .error, search: .error)
        
        // When
        sut.fetchMovies()
        
        // Wait
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertTrue(spy.onGetMoviesForHomeAllFailedCalled, "doSomething(request:) should ask the presenter to present error when all services returned failure")
        
    }
    
    func testSomeMovieCategoriesSucceed(){
        // Given
        let spy = HomePresentationLogicSpy()
        spy.expectation = expectation(description: "Downloading movies categories")
        sut.presenter = spy
        sut.movieService = MovieServiceMock.init(popular: .error, detail: .emptyBodyArray, topRated: .emptyBodyArray, newReleases: .error, upcoming: .success, reviews: .error, search: .error)
        
        // When
        sut.fetchMovies()
        
        // Wait
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertTrue(spy.onGetMoviesForHomeSucceedCalled, "doSomething(request:) should ask the presenter to format the results even if only one category succeed (upcoming) and the rest return error or empty bodies")
        
    }
    
    func testInteractorCallsCorrectServices(){
        // Given
        let spy = HomePresentationLogicSpy()
        spy.expectation = expectation(description: "Downloading movies categories")
        sut.presenter = spy
        let serviceMock = MovieServiceMock.init(popular: .success, detail: .error, topRated: .success, newReleases: .success, upcoming: .success, reviews: .error, search: .error)
        sut.movieService = serviceMock
        
        // When
        sut.fetchMovies()
        
        // Wait
        waitForExpectations(timeout: 1, handler: nil)
        
        // Then
        XCTAssertTrue(serviceMock.newReleasesCalled, "fetchMovies() should use the new releases movies api call")
        XCTAssertTrue(serviceMock.popularCalled, "fetchMovies() should use the popular movies api call")
        XCTAssertTrue(serviceMock.topRatedCalled, "fetchMovies() should use the topRated movies api call")
        XCTAssertTrue(serviceMock.upcomingCalled, "fetchMovies() should use the upcoming movies api call")
    }
    
}
