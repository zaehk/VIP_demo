//
//  MovieSearchViewControllerTests.swift
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

//class MovieSearchViewControllerTests: XCTestCase
//{
//  // MARK: Subject under test
//  
//  var sut: MovieSearchViewController!
//  var window: UIWindow!
//  
//  // MARK: Test lifecycle
//  
//  override func setUp()
//  {
//    super.setUp()
//    window = UIWindow()
//    setupMovieSearchViewController()
//  }
//  
//  override func tearDown()
//  {
//    window = nil
//    super.tearDown()
//  }
//  
//  // MARK: Test setup
//  
//  func setupMovieSearchViewController()
//  {
//    let bundle = Bundle.main
//    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
//    sut = storyboard.instantiateViewController(withIdentifier: "MovieSearchViewController") as! MovieSearchViewController
//  }
//  
//  func loadView()
//  {
//    window.addSubview(sut.view)
//    RunLoop.current.run(until: Date())
//  }
//  
//  // MARK: Test doubles
//  
//  class MovieSearchBusinessLogicSpy: MovieSearchBusinessLogic
//  {
//    var doSomethingCalled = false
//    
//    func doSomething(request: MovieSearch.Something.Request)
//    {
//      doSomethingCalled = true
//    }
//  }
//  
//  // MARK: Tests
//  
//  func testShouldDoSomethingWhenViewIsLoaded()
//  {
//    // Given
//    let spy = MovieSearchBusinessLogicSpy()
//    sut.interactor = spy
//    
//    // When
//    loadView()
//    
//    // Then
//    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
//  }
//  
//  func testDisplaySomething()
//  {
//    // Given
//    let viewModel = MovieSearch.Something.ViewModel()
//    
//    // When
//    loadView()
//    sut.displaySomething(viewModel: viewModel)
//    
//    // Then
//    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
//  }
//}