//
//  HomePresenterTests.swift
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

class HomePresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: HomePresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupHomePresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupHomePresenter()
    {
        sut = HomePresenter()
    }
    
    // MARK: Test doubles
    
    class HomeDisplayLogicSpy: HomeDisplayLogic
    {
        
        var numberOfCategoriesInViewModel = 0
        var loadCategoriesAndMoviesCalled = false
        var showEmptyStateViewOnErrorCalled = false
        
        func loadCategoriesAndMovies(viewModel: HomeViewModel) {
            self.numberOfCategoriesInViewModel = viewModel.movieCategories.count
            loadCategoriesAndMoviesCalled = true
        }
        
        func showEmptyStateView(emptyStateViewModel: HomeViewModel) {
            showEmptyStateViewOnErrorCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testOnGetMoviesForHomeSucceed()
    {
        // Given
        let spy = HomeDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        let movieResultResponseModel: MovieResultResponseModel = JSONMockDecoder.decode(mock: "movieResultResponseModel")
        sut.onGetMoviesForHomeSucceed(popular: [movieResultResponseModel], topRated: [movieResultResponseModel], nowPlaying: [],upcoming: [])
        
        // Then
        XCTAssertTrue(spy.loadCategoriesAndMoviesCalled, "onGetMoviesForHomeSucceed() should ask the view controller to display the categories")
        XCTAssertEqual(spy.numberOfCategoriesInViewModel, 2, "onGetMovieForHomeSucced() should create a viewmodel with the same number of cell models as the movies arrays that are not empty (2 in this case)")
    }
    
    func testOnlyPopulatedMovieArraysAreLoadedInTheViewModel(){
        // Given
        let spy = HomeDisplayLogicSpy()
        sut.viewController = spy

        // When
        let movieResultResponseModel: MovieResultResponseModel = JSONMockDecoder.decode(mock: "movieResultResponseModel")
        
        sut.onGetMoviesForHomeSucceed(popular: [movieResultResponseModel], topRated: [movieResultResponseModel], nowPlaying: [],upcoming: [])
        
        // Then
        XCTAssertTrue(spy.loadCategoriesAndMoviesCalled, "onGetMoviesForHomeSucceed() should ask the view controller to display the categories")
        XCTAssertEqual(spy.numberOfCategoriesInViewModel, 2, "onGetMovieForHomeSucced() should create a viewmodel with the same number of cell models as the movies arrays that are not empty (2 in this case)")
    }
    
    func testOnGetMoviesForHomeAllFailed()
    {
        // Given
        let spy = HomeDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.onGetMoviesForHomeAllFailed()
        
        // Then
        XCTAssertTrue(spy.showEmptyStateViewOnErrorCalled, "onGetMoviesForHomeAllFailed() should ask the viewcontroller to show the emptyState when no results are fetched")
    }
    
}
