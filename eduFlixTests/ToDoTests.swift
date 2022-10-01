//
//  ToDoTests.swift
//  eduFlixTests
//
//  Created by Reya on 01.05.22.
//

import XCTest
@testable import eduFlix // enables access to code inside app

//NamingStructure: test_UnitOfWork_StateUnderTest_ExpectedBehavr
//NamingStructure: test_[struct or class]_[variable or function)_[expected result]
//Testing Structure: Given , When, Then

class ToDoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Todo_showAddToDoView_shouldBeFalse() {
        // given
        
        let showingAddView : Bool = false
        
        //when
       let vm =  UnitTestingTodoViewModel(showAddToDoView: showingAddView)
        // then
        
        XCTAssertFalse(vm.showAddToDoView)
    }
    
    func test_Todo_showAddToDoView_shouldBeInjectedValue() { // only tests showingaddview being true or false
        // given
        
        let showingAddView : Bool = Bool.random()
        
        //when
       let vm =  UnitTestingTodoViewModel(showAddToDoView: showingAddView)
        // then
        XCTAssertEqual(vm.showAddToDoView, showingAddView)
      
    }
    
    
    func test_Todo_showAddToDoView_shouldBeInjectedValue_stress() {
        
        for _ in 0..<100 {
        // given
        
        let showingAddView : Bool = Bool.random()
        
        //when
       let vm =  UnitTestingTodoViewModel(showAddToDoView: showingAddView)
        // then
        XCTAssertEqual(vm.showAddToDoView, showingAddView)
      
    }
    }
    
    func test_Todo_addNewTodo_shouldBeEmpty() { // only tests showingaddview being true or false
       
      
    }

    
//    func test_launch() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
