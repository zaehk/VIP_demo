//
//  MovieSearchPresenterTests.swift
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

class MovieSearchPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: MovieSearchPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupMovieSearchPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMovieSearchPresenter()
    {
        sut = MovieSearchPresenter()
    }
    
    // MARK: Test doubles
    
    class MovieSearchDisplayLogicSpy: MovieSearchDisplayLogic
    {
        var showNoMoviesFoundOrErrorCalled = false
        var showResultMoviesCalled = false
        var numberOfElementsToShow: Int = 0
        var viewModelContainsEmptyStateCollectionCell = false
        var isEmptyStateCollectionCell = false
        
        
        func showResultMovies(viewModel: MovieSearchViewModel) {
            showResultMoviesCalled = true
            numberOfElementsToShow = viewModel.movies.count
        }
        
        func showNoMoviesFoundOrError(viewModel: MovieSearchViewModel) {
            showNoMoviesFoundOrErrorCalled = true
            numberOfElementsToShow = viewModel.movies.count
            isEmptyStateCollectionCell = viewModel.movies.first is EmptyStateCollectionCellModel
        }

    }
    
    // MARK: Tests
    
    func testPresentMatchingMovies()
    {
        // Given
        let spy = MovieSearchDisplayLogicSpy()
        sut.viewController = spy
        let movieResultResponse: MovieResultResponseModel = JSONMockDecoder.decode(mock: "movieResultResponseModel")
        let moviesToPresent: [MovieResultResponseModel] = [movieResultResponse]
        
        
        // When
        sut.presentMatchingMovies(movies: moviesToPresent)
        
        // Then
        XCTAssertTrue(spy.showResultMoviesCalled, "presentMatchingMovies(response:) should ask the view controller to display the matching movies")
        XCTAssertEqual(spy.numberOfElementsToShow, moviesToPresent.count, "presentMatchingMovies(response:) should format the number of response models into the same number of cell models")
    }
    
    func testShowNoMoviesFoundOrError()
    {
        // Given
        let spy = MovieSearchDisplayLogicSpy()
        sut.viewController = spy
        
        
        // When
        sut.presentNoMoviesFoundOrError()
        
        // Then
        XCTAssertTrue(spy.showNoMoviesFoundOrErrorCalled, "presentNoMoviesFoundOrError() should ask the view controller to display an empty state cell when error or no matching movies")
        XCTAssertEqual(spy.numberOfElementsToShow, 1, "presentNoMoviesFoundOrError() should only ask the viewcontroller to display one cell (the empty state cell)")
        XCTAssertTrue(spy.isEmptyStateCollectionCell, "presentNoMoviesFoundOrError() should only ask the viewcontroller to display a cell with model of type EmptyStateCollectionCellModel")
    }
    
}
