//
//  MovieDetailInteractorTests.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//
//@testable import VIP_demo
//import XCTest
//
//class MovieDetailInteractorTests: XCTestCase
//{
//  // MARK: Subject under test
//  
//  var sut: MovieDetailInteractor!
//  
//  // MARK: Test lifecycle
//  
//  override func setUp()
//  {
//    super.setUp()
//    setupMovieDetailInteractor()
//  }
//  
//  override func tearDown()
//  {
//    super.tearDown()
//  }
//  
//  // MARK: Test setup
//  
//  func setupMovieDetailInteractor()
//  {
//    sut = MovieDetailInteractor()
//  }
//  
//  // MARK: Test doubles
//  
//  class MovieDetailPresentationLogicSpy: MovieDetailPresentationLogic
//  {
//    var presentSomethingCalled = false
//    
//    func presentSomething(response: MovieDetail.Something.Response)
//    {
//      presentSomethingCalled = true
//    }
//  }
//  
//  // MARK: Tests
//  
//  func testDoSomething()
//  {
//    // Given
//    let spy = MovieDetailPresentationLogicSpy()
//    sut.presenter = spy
//    let request = MovieDetail.Something.Request()
//    
//    // When
//    sut.doSomething(request: request)
//    
//    // Then
//    XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
//  }
//}