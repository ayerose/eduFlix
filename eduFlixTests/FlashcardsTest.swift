//
//  flashcardstest.swift
//  eduFlixTests
//
//  Created by Reya on 01.05.22.
//

import XCTest
@testable import eduFlix // enables access to code inside app
//NamingStructure: test_UnitOfWork_StateUnderTest_ExpectedBehavr
//NamingStructure: test_[struct or class]_[variable or function)_[expected result]
//Testing Structure: Given , When, Then


class FlashcardsTest: XCTestCase {

    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
     
    }

    
    func test_Flashcards_showAnswer_shouldBeFalse() {
        // given
        
        let showAnswer : Bool = false
        
        //when
       let vm =  UnitTestingFlashcardsViewModel(showAnswer: showAnswer)
        // then
        
        XCTAssertFalse(vm.showAnswer)
    }
    
    func test_Flashcards_showAnswer_shouldBeInjectedValue() { // only tests showAnswer being true or false
        // given
        
        let showAnswer : Bool = Bool.random()
        
        //when
        let vm =  UnitTestingFlashcardsViewModel(showAnswer: showAnswer)
        // then
        XCTAssertEqual(vm.showAnswer, showAnswer)
      
    }
    
    
    func test_Flashcards_showAnswer_shouldBeInjectedValue_stress() {
        
        for _ in 0..<100 {
        // given
        
        let showAnswer : Bool = Bool.random()
        
        //when
       let vm =  UnitTestingFlashcardsViewModel(showAnswer: showAnswer)
        // then
        XCTAssertEqual(vm.showAnswer,showAnswer)
      
    }
    }
    
    
    func testExample() throws {

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
