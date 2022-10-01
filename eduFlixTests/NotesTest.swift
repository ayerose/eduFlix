//
//  NotesTest.swift
//  eduFlixTests
//
//  Created by Reya on 01.05.22.
//

import XCTest
@testable import eduFlix // enables access to code inside app
//NamingStructure: test_UnitOfWork_StateUnderTest_ExpectedBehavr
//NamingStructure: test_[struct or class]_[variable or function)_[expected result]
//Testing Structure: Given , When, Then


class NotesTest: XCTestCase {

    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
     
    }

    
    func test_Notes_revealImagePicker_shouldBeFalse() {
        // given
        
        let revealImagePicker : Bool = false
        
        //when
       let vm =  UnitTestingNotesViewModel(revealImagePicker: revealImagePicker)
        // then
        
        XCTAssertFalse(vm.revealImagePicker)
    }
    
    func test_Notes_revealImagePicker_shouldBeInjectedValue() { // only tests revealImagePicker being true or false
        // given
        
        let revealImagePicker : Bool = Bool.random()
        
        //when
        let vm =  UnitTestingNotesViewModel(revealImagePicker: revealImagePicker)
        // then
        XCTAssertEqual(vm.revealImagePicker, revealImagePicker)
      
    }
    
    
    func test_Notes_revealImagePicker_shouldBeInjectedValue_stress() {
        
        for _ in 0..<100 {
        // given
        
        let revealImagePicker : Bool = Bool.random()
        
        //when
       let vm =  UnitTestingNotesViewModel(revealImagePicker: revealImagePicker)
        // then
        XCTAssertEqual(vm.revealImagePicker, revealImagePicker)
      
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
